# QA Testing Quiz

### Scenario
The frontend team has developed a prototype login portal for an up and coming platform.
However, they have not implemented any testing yet and it is up to you to do so.

As the QA developer, what is tested and how it is tested is up to you.
Management simply asks that these tests provide as much evidence as possible of the platform's reliability.

### Notes
- Submission must include a link to a public fork/clone of this repository
- We typically use Jest for testing node.js/API related logic and Cypress for testing UI functionality, however, you are more than welcome to use any testing framework you desire so long as you are able to provide reasonable justification

# Robot Framework Installation and Mocked API Setup
## Mocked API Setup

Follow these steps to set up the mocked API:
1. **Install Dependencies**
   - Run the following command to install the necessary dependencies:
     ```bash
     npm install
     ```

   - Ensure all dependencies listed in `package.json` are installed.
  
2. **Start Server**
   - Run the following command to install the necessary dependencies:
     ```bash
     yarn start
     ```
     
## Robot Framework Installation

Follow these steps to install Robot Framework and run tests:

1. **Install Python 3**
   - Ensure Python 3 is installed on your system. You can download it from the [official Python website](https://www.python.org/downloads/).

2. **Install Robot Framework**
   - Open your terminal or command prompt and run:
     ```bash
     pip install robotframework
     ```

3. **Install HTTP Library**
   - To install the HTTP library for Robot Framework, execute:
     ```bash
     pip install robotframework-requests
     ```

4. **Run Robot Test**
   - To execute a Robot Framework test, use:
     ```bash
     cd mockedAPI/RF-Test &&
     robot mock-api.robot
     ```

