# coding=utf-8
"""Generate DICOM-derived code systems and value sets as FHIR Shorthand."""
import argparse
import os
import sys
from pathlib import Path

from dicom_spec_parser import get_attribute_defined_terms, get_data_elements


def main(args=None):
    """Parse arguments and generate DICOM attribute code system FSH files."""
    if not args:
        args = sys.argv[1:]
    parser = argparse.ArgumentParser()
    parser.add_argument("--fsh_path", help="FHIR Shorthand path", type=Path,
                        required=False)
    args = parser.parse_args()
    fsh_path = args.fsh_path or os.path.join(Path(__file__).parent.parent, 'input', 'fsh')

    # Generate a FHIR Shorthand file for each attribute with a set of defined terms
    # or enumerated values
    data_elements = get_data_elements()
    for attribute, defined_terms in get_attribute_defined_terms().items():
        if attribute in data_elements:
            attribute_name = data_elements[attribute].name
            attribute_tag = data_elements[attribute].tag
            attribute_keyword = data_elements[attribute].keyword
            fsh_filename = f'CodeSystem-dicom-{attribute_keyword}.fsh'
            print(f'Generating FHIR Shorthand for {attribute_name} in {fsh_path}/{fsh_filename}')
            with open(os.path.join(fsh_path, fsh_filename), 'w') as fsh_file:
                fsh_file.write(f'CodeSystem: {attribute_keyword}\n')
                fsh_file.write(f'Id: {attribute}\n')
                fsh_file.write(f'Title: "DICOM® Attribute {attribute_name} '
                               f'{attribute_tag} values"\n')
                fsh_file.write(f'Description: "DICOM® Attribute {attribute_name} {attribute_tag} '
                               f'Defined Terms and Enumerated Values Extracted from '
                               f'DICOM PS3.3."\n')
                # fsh_file.write('Copyright: "DICOM® is a registered trademark of the National Electrical Manufacturers Association for its standards publications relating to digital communications of medical information."\n\n')
                fsh_file.write('* ^caseSensitive = true\n')
                fsh_file.write('* ^content = #complete\n')
                fsh_file.write('* ^experimental = false\n\n')

                for term, value in defined_terms.items():
                    fsh_file.write(f'* #{term} "{value}" "{value}"\n')


if __name__ == '__main__':
    main()
