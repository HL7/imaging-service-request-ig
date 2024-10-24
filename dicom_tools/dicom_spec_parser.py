# coding=utf-8
"""Download and parse tables from DICOM spec."""

from typing import List, Optional

import requests
from bs4 import BeautifulSoup, Tag

DATA_ELEMENT_TABLE = 'https://dicom.nema.org/medical/dicom/current/output/chtml/part06/chapter_6.html#table_6-1'
UID_TABLE = 'https://dicom.nema.org/medical/dicom/current/output/chtml/part06/chapter_A.html#table_A-1'


def get_dicom_table(table_uri: str) -> Optional[Tag]:
    """Get a table from the DICOM standard.

    :param table_uri: URI of the table to get.
    """
    table_page = BeautifulSoup(requests.get(table_uri).text, "html.parser")
    try:
        table = table_page.select('div[class=table-contents]')[0]
    except IndexError:
        print('Error: Could not find table')
        return None

    return table


def get_data_elements(include_retired: bool = True, include_dicos: bool = False) -> List[List[str]]:
    """Get data elements from DICOM standard.

    :param include_retired: Include retired data elements.
    :param include_dicos: Include DICOS data elements.
    """
    data_element_list: List[List[str]] = []
    data_element_table = get_dicom_table(DATA_ELEMENT_TABLE)
    if not data_element_table:
        print('Error: Could not find data element table')
        return []
    for data_element in data_element_table.find_all('tr'):
        element_fields = data_element.find_all('td')
        if len(element_fields):
            if ((include_retired or 'RET' not in element_fields[5].text) and
                    (include_dicos or 'DICOS' not in element_fields[5].text)):
                data_element_list.append([
                    element_fields[2].text.replace('â\x80\x8b', '').strip(),
                    element_fields[1].text.strip(),
                    element_fields[0].text.strip(),
                    element_fields[5].text.strip()
                ])
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