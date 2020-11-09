#!/usr/bin/env python3

import connexion

from openapi_server import encoder


application = connexion.App(__name__, specification_dir='./openapi_server/openapi/', options={"swagger_ui": True, "serve_spec": True})
application.app.json_encoder = encoder.JSONEncoder
application.add_api('openapi.yaml', arguments={'title': 'OpenAPI Petstore'}, pythonic_params=True)



if __name__ == '__main__':
    application.run(host='0.0.0.0', port=80)

