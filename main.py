import xml.etree.ElementTree as ET
import webapp2
import jinja2
import os

JINJA_ENVIRONMENT = jinja2.Environment(
    loader=jinja2.FileSystemLoader(os.path.dirname(__file__)))

TEMPLATE = """\
<html>
    <body>
        <form>


    %s
        </form>
    </pre>
  </body>
</html>
"""


class MainPage(webapp2.RequestHandler):
    def get(self):
        self.basicElements = dict()
        self.output = ''
        ET.register_namespace("", "http://www.w3.org/2001/XMLSchema")
        tree = ET.parse('SchemaXML.xsd')
        self.root = tree.getroot()
        self.findBasics()
        self.output += self.parcours(self.root[0])
        self.response.write(TEMPLATE % (self.output))


    def parcours(self, node):
        txt = ""
        isComplex = False
        if node.find('{http://www.w3.org/2001/XMLSchema}complexType'):
            txt += "<fieldset><legend>%s</legend>" % node.attrib['name']
            isComplex = True


        if node.tag == '{http://www.w3.org/2001/XMLSchema}attribute' and 'type' in node.attrib:
            txt += "@%s <input type=\"text\" value=\"%s\" /><br/>" % (node.attrib['name'], node.attrib['type'])
        if node.tag == '{http://www.w3.org/2001/XMLSchema}element' and 'type' in node.attrib:
            txt += "%s <input type=\"text\" value=\"%s\" /><br/>" % (node.attrib['name'], node.attrib['type'])

        if node.tag == '{http://www.w3.org/2001/XMLSchema}restriction':
            txt += "<select>"
        if node.tag == '{http://www.w3.org/2001/XMLSchema}enumeration':
            txt += "<option>%s</option>" % node.attrib['value']
        if node.tag == '{http://www.w3.org/2001/XMLSchema}pattern':
            for t in node.attrib['value'].split('|'):
                txt += "<option>%s</option>" % t


        if 'ref' in node.attrib:
            for e in self.root.findall('{http://www.w3.org/2001/XMLSchema}element'):
                if e.attrib['name'] == node.attrib['ref']:
                    txt += self.parcours(e)

        for child in node:
            txt += self.parcours(child)

        if node.tag == '{http://www.w3.org/2001/XMLSchema}restriction':
            txt += "</select>"
        if isComplex:
            txt += "</fieldset>"
        return txt

    def findBasics(self):
        elements = self.root.findall('{http://www.w3.org/2001/XMLSchema}element')
        for e in elements:
            if 'type' in e.attrib:
                self.basicElements[e.attrib['name']] = e.attrib['type']
            for st in e.findall('{http://www.w3.org/2001/XMLSchema}simpleType'):
                for r in st.findall('{http://www.w3.org/2001/XMLSchema}restriction'):
                    self.basicElements[e.attrib['name']] = r.attrib['base']
                    # TODO handle restrictions

app = webapp2.WSGIApplication([('/', MainPage)],
                              debug=True)