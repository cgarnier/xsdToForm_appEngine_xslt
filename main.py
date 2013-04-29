from compiler import transformer
import xml.etree.ElementTree as ET
import webapp2
import jinja2
import os
import lxml
from lxml import etree
import cgi, os, sys

import os.path

JINJA_ENVIRONMENT = jinja2.Environment(
    loader=jinja2.FileSystemLoader(os.path.dirname(__file__)))




class MainPage(webapp2.RequestHandler):
    def get(self):


        style = etree.parse('xsl_templates/main.xsl')

        self.output = ''

        tree = etree.parse('res/SchemaXML.xsd')

        trans = etree.XSLT(style)
        result = trans(tree)
        self.root = tree.getroot()



        template_values = {
            'content': result,

        }

        template = JINJA_ENVIRONMENT.get_template('templates/layout1.html')
        self.response.write(template.render(template_values))
        #self.response.write(str(result))

    def post(self):
        pass



app = webapp2.WSGIApplication([('/', MainPage)],
                              debug=True)