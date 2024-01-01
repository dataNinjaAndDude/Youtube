import logging

logger = logging.getLogger()
logger.setLevel(logging.INFO)

console_handler = logging.StreamHandler()
console_handler.setLevel(logging.INFO)
logger.addHandler(console_handler)

def lambda_handler(event, context):
    logger.info(f'triggered with event: {event}')

    return {
        'statusCode': 200,
        'event': event
    }
