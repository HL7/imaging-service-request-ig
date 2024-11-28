# coding=utf-8
"""Download and parse tables from DICOM spec."""
from dataclasses import dataclass
from typing import List, Optional, Dict

import requests
from bs4 import BeautifulSoup, Tag

DATA_ELEMENT_TABLE = 'https://dicom.nema.org/medical/dicom/current/output/chtml/part06/chapter_6.html#table_6-1'
UID_TABLE = 'https://dicom.nema.org/medical/dicom/current/output/chtml/part06/chapter_A.html#table_A-1'


@dataclass
class DataElement:
    """Data Element class."""
    tag: str
    name: str
    keyword: str
    vr: str
    vm: str
    retired: bool


def get_dicom_object(object_uri: str, object_class: str) -> Optional[Tag]:
    """Get a DICOM object from the DICOM standard.

    :param object_uri: URI of the object to get.
    :param object_class: Class of the object to get.
    """
    object_page = BeautifulSoup(requests.get(object_uri).text, "html.parser")
    try:
        dicom_object = object_page.select(f'div[class={object_class}]')[0]
    except IndexError:
        print('Error: Could not find object')
        return None

    return dicom_object

def get_dicom_table(table_uri: str) -> Optional[Tag]:
    """Get a table from the DICOM standard.

    :param table_uri: URI of the table to get.
    """
    table_page = get_dicom_object(table_uri, 'table-contents')
    if not table_page:
        print('Error: Could not find table page')
        return None
    return table_page


def get_dicom_variable_list(list_uri: str) -> Optional[Tag]:
    """Get a variable list from the DICOM standard.

    :param list_uri: URI of the table to get.
    """
    list_page = get_dicom_object(list_uri, 'variablelist')
    if not list_page:
        print('Error: Could not find list page')
        return None
    return list_page


def get_data_elements(include_dicos: bool = False) \
        -> Dict[str, DataElement]:
    """Get data elements from DICOM standard.

    :param include_dicos: Include DICOS data elements.
    """
    data_element_list = dict()
    data_element_table = get_dicom_table(DATA_ELEMENT_TABLE)
    if not data_element_table:
        print('Error: Could not find data element table')
        return data_element_list
    for data_element in data_element_table.find_all('tr'):
        element_fields = data_element.find_all('td')
        if len(element_fields):
            if include_dicos or 'DICOS' not in element_fields[5].text:
                tag = element_fields[0].text.strip().replace('(', '').replace(')', '').replace(',',
                                                                                               '')
                data_element_list[tag] \
                    = DataElement(tag=element_fields[0].text.strip(),
                                  name=element_fields[1].text.strip(),
                                  keyword=element_fields[2].text.replace('â\x80\x8b', '').strip(),
                                  vr=element_fields[3].text.strip(),
                                  vm=element_fields[4].text.strip(),
                                  retired='RET' in element_fields[5].text)
    return data_element_list

def get_uid_values(include_retired: bool = True) -> List[List[str]]:
    """Get UID values from DICOM standard.

    :param include_retired: Include retired UIDs.
    """
    uid_values: List[List[str]] = []
    uid_table = get_dicom_table(UID_TABLE)
    if not uid_table:
        print('Error: Could not find UID table')
        return []
    for uid in uid_table.find_all('tr'):
        uid_fields = uid.find_all('td')
        if len(uid_fields):
            if include_retired or 'RET' not in uid_fields[3].text:
                uid_values.append([
                    uid_fields[0].text.replace('â\x80\x8b', '').strip(),
                    uid_fields[1].text.strip(),
                    uid_fields[2].text.replace('â\x80\x8b', '').strip(),
                    uid_fields[3].text.strip()
                ])
    return uid_values


def get_transfer_syntaxes(include_retired: bool = True) -> List[List[str]]:
    """Get transfer syntaxes from DICOM standard.

    :param include_retired: Include retired transfer syntaxes.
    """
    transfer_syntaxes: List[List[str]] = []
    uid_list = get_uid_values(include_retired)
    for uid in uid_list:
        if uid[3] == 'Transfer Syntax':
            transfer_syntaxes.append([
                uid[0],
                uid[1],
                uid[2]
            ])
    return transfer_syntaxes

def get_sop_classes(include_retired: bool = True) -> List[List[str]]:
    """Get SOP classes from DICOM standard.

    :param include_retired: Include retired SOP classes.
    """
    sop_classes: List[List[str]] = []
    uid_list = get_uid_values(include_retired)
    for uid in uid_list:
        if uid[3] == 'SOP Class':
            sop_classes.append([
                uid[0],
                uid[1],
                uid[2]
            ])
    return sop_classes

def get_defined_terms(table_uri: str = None, defined_terms_table: Tag = None) -> Dict[str, str]:
    """Get defined terms from DICOM standard.

    :param table_uri: URI of the table to get.
    :param defined_terms_table: Object containing the defined terms table.
    """
    defined_terms = dict()
    defined_terms_table = defined_terms_table or get_dicom_variable_list(table_uri)
    if not defined_terms_table:
        print('Error: Could not find defined terms table')
        return defined_terms
    term_list = defined_terms_table.find_all('dt')
    definition_list = defined_terms_table.find_all('dd')
    if len(term_list) != len(definition_list):
        print('Error: Term and definition lists do not match')
        return defined_terms
    for i in range(len(term_list)):
        defined_terms[term_list[i].text.strip()] = (definition_list[i].text.strip()
                                                    or term_list[i].text.strip())

    return defined_terms


def get_modality_lut_and_rescale_types():
    """Get modality LUT and rescale types from DICOM standard."""
    base_url = 'https://dicom.nema.org/medical/dicom/current/output/chtml/part03/sect_C.11.html#sect_C.11.1.1.2'
    modality_lut_and_rescale_types = get_defined_terms(base_url)
    return modality_lut_and_rescale_types


def get_defined_terms_tables():
    """Get defined terms tables from DICOM standard."""
    base_url = 'https://dicom.nema.org/medical/dicom/current/output/html/part03.html'
    object_page = BeautifulSoup(requests.get(base_url).text, "html.parser")
    defined_terms_tables = dict()
    try:
        dicom_object = object_page.select('div[class=section]')
        for section in dicom_object:
            section_title_block = section.find('h5', attrs={"class": "title"})
            if section_title_block:
                section_title = section_title_block.find('a')['id']
                defined_terms_table = section.find('dl', attrs={"class": "variablelist compact"})
                if defined_terms_table:
                    print(f'Found defined terms table in section: {section_title}')
                    defined_terms_tables[section_title] \
                        = get_defined_terms(defined_terms_table=defined_terms_table)
        return defined_terms_tables
    except IndexError:
        print('Error: Could not find object')
        return None

def get_module_tables():
    """Get table contents from DICOM standard."""
    base_url = 'https://dicom.nema.org/medical/dicom/current/output/html/part03.html'
    object_page = BeautifulSoup(requests.get(base_url).text, "html.parser")
    module_tables = dict()
    try:
        dicom_object = object_page.select(f'div[class=table]')
        for table in dicom_object:
            table_title = table.find('p', attrs={"class": "title"})
            if table_title and ('Module Attributes' in table_title.text
                                or 'Macro Attributes' in table_title.text):
                module_tables[table_title.text.strip().replace('Â','')] = table
        return module_tables
    except IndexError:
        print('Error: Could not find object')
        return None


def get_attribute_defined_terms():
    """Get attribute defined terms from DICOM standard."""
    section_tables = get_defined_terms_tables()
    defined_terms_tables = dict()
    for title, module_table in get_module_tables().items():
        attribute_list = module_table.find_all('tr')
        for attribute in attribute_list:
            attribute_fields = attribute.find_all('td')
            if len(attribute_fields) > 3:
                attribute_tag = (attribute_fields[1].text.strip()
                                 .replace('(', '').replace(')', '').replace(',', ''))
                defined_terms_reference = attribute_fields[3].find('a', href=True,
                                                                   attrs={"class": "xref"})
                defined_terms_dict = dict()
                if (defined_terms_reference
                        and defined_terms_reference["href"].replace('#', '') in section_tables):
                    section_reference = defined_terms_reference["href"].replace('#', '')
                    print(f'Found defined terms reference for {title}:{attribute_tag} to '
                      f'{section_reference}')
                    defined_terms_dict = section_tables[section_reference]
                else:
                    defined_terms_table \
                        = attribute_fields[3].find('dl', attrs={"class": "variablelist compact"})
                    if defined_terms_table:
                        defined_terms_dict = get_defined_terms(defined_terms_table=defined_terms_table)
                    print(f'Found defined terms table in module: {title}')
                if defined_terms_dict:
                    if attribute_tag in defined_terms_tables:
                        if defined_terms_tables[attribute_tag] != defined_terms_dict:
                            print(f'Warning: Duplicate defined terms table for {title}: '
                                  f'{attribute_tag}. Entries will be merged into:\n'
                                  f'{defined_terms_tables[attribute_tag]}')
                            defined_terms_tables[attribute_tag].update(defined_terms_dict)
                    else:
                        defined_terms_tables[attribute_tag]=defined_terms_dict
                        print(f'Adding defined terms table for {title}: {attribute_tag}\n'
                              f'{defined_terms_tables[attribute_tag]}')
    return defined_terms_tables
