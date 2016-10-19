import xml.etree.ElementTree as ET
import xml.dom.minidom as minidom


class XmlUtil:
    def __init__(self):
        pass

    @staticmethod
    def prettify(elem):
        """Return a pretty-printed XML string for the Element.
        """
        rough_string = ET.tostring(elem, 'utf-8')
        reparsed = minidom.parseString(rough_string)
        xml_string = reparsed.toprettyxml(indent="\t")
        # to remove empty lines
        non_blank_lines = filter(lambda l: l.strip(), [line for line in xml_string.splitlines(True)])
        return ''.join(non_blank_lines)
