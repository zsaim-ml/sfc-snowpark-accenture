# Learning-Snowflake-Snowpark
This repository will walk you through running Snowflake Snowpark Python.

## Requirements
* Snowflake Account
   * [Signup](https://signup.snowflake.com/) for a FREE Snowflake account, make sure that you select the following setup is placed:
   <img width="1300" alt="Screenshot 2023-01-10 at 18 40 37" src="https://user-images.githubusercontent.com/107192982/211624168-1929317f-ba6a-4a21-a5c9-b2db6806f6aa.png"> 
   * Activate your account, and make sure you remember the master user and the email, you will need them in the next step to log in, it's VERY important you remember them otherwise this will NOT work.
   ![Screenshot 2023-01-10 at 14 31 51](https://user-images.githubusercontent.com/107192982/211564818-8ad87d60-d90c-4169-bd53-10f256c4ff72.png)

## Run application
  * Once you are logged in, head over to the top right corner and create a new worksheet
  ![Screenshot 2023-01-10 at 14 36 35](https://user-images.githubusercontent.com/107192982/211565877-371260cc-305a-42d1-94f5-b44b146d52f4.png)
  * Inside of this repository there is file named **setup.sql** -> sql/setup.sql, copy the code and place it in the new worksheet and run it, at the bottom change the credentials for the account that is going to be created.
  ![Screenshot 2023-01-10 at 14 40 46](https://user-images.githubusercontent.com/107192982/211566709-9508058d-d1bc-43de-8487-e1eaada2c2fe.png)
  * You can run the script by clicking the play button (top right corner), make sure you select all the scripts first.
  * Copy the locator from your account
  <img width="1767" alt="Screenshot 2023-01-11 at 10 11 40" src="https://user-images.githubusercontent.com/107192982/211770123-a2d76d92-44e9-462f-9374-0fb4d8312ea4.png">
  * FORK this repository to your own account

  * Create new environment variables in your codespace
  ![Screenshot 2023-01-10 at 14 50 42](https://user-images.githubusercontent.com/107192982/211568887-53e22d8c-88ad-43b6-96c7-9274497cc592.png)
  * Under this repository there is a file named .env you will need to replace the XXX with the locator and the password and create a variable for each of the following variables:
    * SNOWFLAKE_ACCOUNT=XXX.eu-west-3.aws
    * SNOWFLAKE_USER=SVCSNOWPARK
    * SNOWFLAKE_PASSWORD=XXX
    * SNOWFLAKE_VW=LEARNINGSNOWPARKVW
    * SNOWFLAKE_DB=LEARNINGSNOWPARKDB
  * At the end you should have some like this:
  ![Screenshot 2023-01-10 at 14 55 06](https://user-images.githubusercontent.com/107192982/211569900-2544219e-239d-482f-9965-a83b3e454d74.png)

* The last change we need to make is to change the .env files with the actual credentials, edit the file within Github
<img width="1275" alt="Screenshot 2023-01-11 at 10 41 02" src="https://user-images.githubusercontent.com/107192982/211772452-82de4f51-81e3-422d-845a-6dc8230cc99b.png">

## Author
* **Enrique Fuentes** - *2023-01-12*
