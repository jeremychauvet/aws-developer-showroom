import json
import sys
from aws_xray_sdk.core import xray_recorder
from aws_xray_sdk.core import patch_all

patch_all()


@xray_recorder.capture("# Add a book to library")
def manageBook(event, context):
    try:
        # Convert string to JSON.
        body = json.loads(event["Records"][0]["body"])
        print(body)

    except:
        print("[ERROR] " + str(sys.exc_info()[1]))