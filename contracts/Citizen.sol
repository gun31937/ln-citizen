// SPDX-License-Identifier: MIT
pragma solidity >=0.4.25 <0.9.0;

contract Citizen {
	event NewRegister(address person, string firstname, string lastName);

	address public officer;

	enum Status { live, dead }
	enum Gender { Male, Female }

	struct Person {
		// address ownerSecret; hash key
		string firstName;
		string lastName;
		// uint dob;
		// Gender gender;
		// Status status;
		// address father;
		// address mother;
		// address addressNumber;
		// uint idNumber;
	}

	mapping(address => Person) public peoples;

	

	function register(address newId, string memory _firstName, string memory _lastName) public {
		require(msg.sender == officer, "Unauthorized");

		peoples[newId] = Person(_firstName, _lastName);

		emit NewRegister(newId, _firstName, _lastName);
	}

	function assignOfficer() public {
		officer = msg.sender;
	}
	
	function get(address id) public view returns (string memory) {
		return peoples[id].firstName;
	}
}
