from os import environ as env

class Credentials:
    def __init__(self) -> None:
        self.account:str = env.get('SNOWFLAKE_ACCOUNT')
        self.user:str = env.get('SNOWFLAKE_USER')
        self.password:str = env.get('SNOWFLAKE_PASSWORD')
        self.database:str = env.get("SNOWFLAKE_DB")
        self.warehouse:str = env.get("SNOWFLAKE_VW")
