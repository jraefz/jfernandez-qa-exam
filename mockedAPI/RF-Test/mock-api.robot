*** Settings ***
Library                             RequestsLibrary

*** Variables ***
${BASE_URL}                         http://localhost:9999

*** Test Cases ***
Get Home Page
    [Documentation]                 Test the GET / endpoint
    ${response}=                    GET    ${BASE_URL}/
    Should Be Equal As Strings      ${response.status_code}    200

Create User
    [Documentation]                 Test the POST /user endpoint
    ${payload}=                     Create Dictionary    username=JohnDoe    name=John Doe    password=pass123    favouriteFruit=Apple    favouriteMovie=Inception    favouriteNumber=42
    ${response}=                    POST    ${BASE_URL}/user    json=${payload}
    Should Be Equal As Strings      ${response.status_code}    200
    Should Contain                  ${response.text}    Account Created

User Exists Check
    [Documentation]                 Ensure user was created and stored correctly
    ${payload}=                     Create Dictionary    username=JohnDoe    name=John Doe    password=pass123    favouriteFruit=Apple    favouriteMovie=Inception    favouriteNumber=42
    ${response}=                    POST    ${BASE_URL}/user    json=${payload}

    Should Be Equal As Strings      ${response.status_code}    200
    Should Contain                  ${response.text}    Account Already Exists

Update User
    [Documentation]                 Test the PUT /user endpoint
    ${payload}=                     Create Dictionary    username=JohnDoe    name=John Doe Updated    password=newpass123    favouriteFruit=Banana    favouriteMovie=Matrix    favouriteNumber=21
    ${response}=                    PUT    ${BASE_URL}/user    json=${payload}
    Should Be Equal As Strings      ${response.status_code}    200
    Should Contain                  ${response.text}    Account Updated

Delete User
    [Documentation]                 Test the DELETE /user endpoint
    ${payload}=                     Create Dictionary    username=JohnDoe
    ${response}=                    DELETE    ${BASE_URL}/user    json=${payload}
    Should Be Equal As Strings      ${response.status_code}    200
    Should Contain                  ${response.text}    Account Deleted

User Does Not Exist Check
    [Documentation]                 Ensure user does not exist after deletion
    ${response}=                    DELETE    ${BASE_URL}/user    params=username=JohnDoe
    Should Be Equal As Strings      ${response.status_code}    200
    Should Contain                  ${response.text}    Account Does Not Exist

Update Nonexistent User
    [Documentation]                 Ensure attempting to update a non-existent user returns an error
    ${payload}=                     Create Dictionary    username=NonExistentUser    name=Jane Doe    password=pass456    favouriteFruit=Orange    favouriteMovie=Matrix Reloaded    favouriteNumber=30
    ${response}=                    PUT    ${BASE_URL}/user    json=${payload}
    Should Be Equal As Strings      ${response.status_code}    200
    Should Contain                  ${response.text}    Account Does NOT Exist
