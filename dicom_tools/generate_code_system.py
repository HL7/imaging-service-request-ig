# coding=utf-8
"""Generate DICOM-derived code systems and value sets as FHIR Shorthand."""
import argparse
import os
import sys
from pathlib import Path

from typing import Dict

from dicom_spec_parser import get_data_elements, get_uid_values, get_transfer_syntaxes, \
    get_sop_classes, DataElement

UID_CODE_URL = "http://hl7.org/fhir/uv/imaging-service-request-ig/CodeSystem/dicom-uids"
RESOURCE_VALUES = {
    'data_elements': {
        'type': 'CodeSystem',
        'type_name': 'DICOMDataElements',
        'title': 'DICOM® Data Elements',
        'description': 'DICOM® Data elements extracted from DICOM PS3.6 Table 6-1.',
        'method': get_data_elements
    },
    'uids': {
        'type': 'CodeSystem',
        'type_name': 'DICOMUIDs',
        'title': 'DICOM® Unique Identifiers',
        'description': 'DICOM® Unique Identifiers extracted from DICOM PS3.6 Table A-1.',
        'method': get_uid_values
    },
    'transfer_syntaxes': {
        'type': 'ValueSet',
        'type_name': 'DICOMTransferSyntaxes',
        'title': 'DICOM® Transfer Syntaxes',
        'description': 'DICOM® Transfer Syntaxes extracted from DICOM PS3.6 Table A-1.',
        'method': get_transfer_syntaxes
    },
    'sop_classes': {
        'type': 'ValueSet',
        'type_name': 'DICOMSOPClasses',
        'title': 'DICOM® SOP Classes',
        'description': 'DICOM® SOP Classes extracted from DICOM PS3.6 Table A-1.',
        'method': get_sop_classes
    }
}


def main(args=None):
    """Parse arguments and generate DICOM data elements FSH file."""
    if not args:
        args = sys.argv[1:]
    parser = argparse.ArgumentParser()
    parser.add_argument("--fsh_path", help="FHIR Shorthand path", type=Path, required=False)
    parser.add_argument("--fsh_filename", help="FHIR Shorthand filename", type=str, required=False)
    parser.add_argument("--dicom_resource", help="DICOM Code System or Value Set to extract", type=str, required=True,
                        choices=['data_elements', 'uids', 'transfer_syntaxes', 'sop_classes'])
    args = parser.parse_args()
    resource_values = RESOURCE_VALUES[args.dicom_resource]
    fsh_path = args.fsh_path or os.path.join(Path(__file__).parent.parent, 'input', 'fsh')
    fsh_filename = args.fsh_filename or f'{resource_values["type"]}-dicom-{args.dicom_resource.replace("_", "-")}.fsh'
    print(f'Generating FHIR Shorthand for {resource_values["title"]} in {fsh_path}/{fsh_filename}')
    with open(os.path.join(fsh_path, fsh_filename), 'w') as fsh_file:
        fsh_file.write(f'{resource_values["type"]}: {resource_values["type_name"]}\n')
        fsh_file.write(f'Id: dicom-{args.dicom_resource.replace("_", "-")}\n')
        fsh_file.write(f'Title: "{resource_values["title"]}"\n')
        fsh_file.write(f'Description: "{resource_values["description"]}"\n')
        # fsh_file.write('Copyright: "DICOM® is a registered trademark of the National Electrical Manufacturers Association for its standards publications relating to digital communications of medical information."\n\n')
        if resource_values["type"] == 'CodeSystem':
            fsh_file.write('* ^caseSensitive = true\n')
            fsh_file.write('* ^content = #complete\n')
        fsh_file.write('* ^experimental = false\n\n')

        resource_args = {
            'include_retired': False
        }
        if args.dicom_resource == 'data_elements':
            value_list: Dict[str, DataElement] = resource_values["method"]()
            for tag, data_element in value_list.items():
                fsh_file.write(f'* #{data_element.keyword} "{data_element.name}" "{data_element.name} {data_element.tag}"\n')
        else:
            value_list = resource_values["method"](**resource_args)
            for value in value_list:
                if resource_values["type"] == 'CodeSystem':
                    fsh_file.write(f'* #{value[0]} "{value[2]}" "{value[1]}"\n')
                else:
                    fsh_file.write(f'* {UID_CODE_URL}#{value[0]} "{value[2]}"\n')


if __name__ == '__main__':
    main()
