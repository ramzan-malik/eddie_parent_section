*** Settings ***

Documentation       End to End Testing Flow
Library             SeleniumLibrary
Library             Collections             # for "Append to List" keyword
Test Setup         Open Chrome Browser With URL
Test Teardown       Close Browser Session         #it will always run after text execution
Resource            ../PageObjects/GenericPage.robot
#Resource            ../PageObjects/LoginPage.robot



*** Variables ***

${url_to_verify}
${success_block_element_to_verify}              //li[@class='breadcrumb-item active']
${success_block_btn_element_to_verify}          //a[@class='btn btn-success']





*** Test Cases ***

test_parent_dashboard.py Link

	GenericPage.Enter Email Id and Password to Login              ${username}           ${valid_password}
	Verify User Successfully Logged In
	Verify Link and Success Block Element of the page             https://app-qa.nykey.org/home/parrents              Sun
	Sleep    3


test_parent_browse_course.py Link

	GenericPage.Enter Email Id and Password to Login              ${username}           ${valid_password}
	Verify User Successfully Logged In
	Verify Link and Success Block Element of the page             https://app-qa.nykey.org/browse/courses               Browse Course
	Sleep    3


test_parent_browse_webinar.py Link

	GenericPage.Enter Email Id and Password to Login              ${username}           ${valid_password}
	Verify User Successfully Logged In
	Verify Link and Success Block Element of the page             https://app-qa.nykey.org/browse/webinar               Browse Webinar
	Sleep    3


test_parent_student_list.py Link

	GenericPage.Enter Email Id and Password to Login              ${username}           ${valid_password}
	Verify User Successfully Logged In
	Verify Link and Success Block Element of the page             https://app-qa.nykey.org/parrents/student/all         Student List
	Sleep    3


test_parent_student_attendance.py Link

	GenericPage.Enter Email Id and Password to Login              ${username}           ${valid_password}
	Verify User Successfully Logged In
	Verify Link and Success Block Element of the page             https://app-qa.nykey.org/parrents/0/attendance         Student ABC
	Sleep    3


test_parent_teacher_meeting.py Link

	GenericPage.Enter Email Id and Password to Login              ${username}           ${valid_password}
	Verify User Successfully Logged In
	Verify Link and Success Block Element of the page             https://app-qa.nykey.org/pt_meeting                   Parent & Teacher Meeting
	Sleep    3


test_parent_invoices.py Link

	GenericPage.Enter Email Id and Password to Login              ${username}           ${valid_password}
	Verify User Successfully Logged In
	Verify Link and Success Block Element of the page             https://app-qa.nykey.org/invoices/parent/all          Invoices
	Sleep    3



*** Keywords ***

Verify User Successfully Logged In
	${current_url} =        Get Location
	Should Contain          ${current_url}       /home


Verify Link and Success Block Element of the page

	[Arguments]                             ${url_to_verify}                        ${success_block_element_to_verify}
	Go To                                   ${url_to_verify}
	Sleep                                   2
	Wait Until Page Contains                ${success_block_element_to_verify}
	Page Should Contain                     ${success_block_element_to_verify}