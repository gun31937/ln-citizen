// SPDX-License-Identifier: MIT
pragma solidity >=0.4.25 <0.9.0;
pragma experimental ABIEncoderV2;


contract Citizen {
	event NewRegister(address addressNumber, 
	string firstName, 
	string lastName,
	uint dob, 
	Gender gender, 
	Status status, 
	address father, 
	address mother, 
	uint idNumber);

	address public officer;

	enum Status { live, dead, meff }
	enum Gender { Male, Female }

	struct Person {
		address addressNumber; 
		string firstName; 
		string lastName;
		uint dob; 
		Gender gender; 
		Status status; 
		address father; 
		address mother; 
		uint idNumber;
	}

	mapping(address => Person) public peoples;

	function register(address _address, 
		string memory _firstName, 
		string memory _lastName,
		uint _dob, 
		Gender _gender, 
		Status _status, 
		address _father, 
		address _mother, 
		uint _idNumber
	) public {
		require(msg.sender == officer, "Unauthorized");
		peoples[_address] = Person(_address, _firstName, _lastName, _dob, _gender, _status, _father, _mother, _idNumber);
		emit NewRegister(_address, _firstName, _lastName, _dob, _gender, _status, _father, _mother, _idNumber);
	}

	function assignOfficer() public {
		officer = msg.sender;
	}

	function get(address _address) public view returns (Person memory){
		return peoples[_address];
	}

	function getStatus(address _address) public view returns (Status) {
		return peoples[_address].status;
	}

	function getParent(address _address) public view returns (Person memory, Person memory) {
	 	Person memory father = get(peoples[_address].father);
		Person memory mother = get(peoples[_address].mother);
		return (father, mother);
	}

	function update(address _address, 
		string memory _firstName, 
		string memory _lastName,
		Status _status
	) public returns (Person memory) {
		require(msg.sender == officer, "Unauthorized");
		Person storage person = peoples[_address];
		if (!isEmpty(_firstName)) { person.firstName = _firstName; }
		if (!isEmpty(_lastName)) { person.lastName = _lastName; }
		if (!isEmptyStatus(_status)) { person.status = _status; }
		
		return peoples[_address];
	}

	function isEmpty(string memory s1) public pure returns(bool){
		return keccak256(abi.encodePacked(s1)) == keccak256(abi.encodePacked(""));
	}

	function isEmptyStatus(Status s1) public pure returns(bool){
		return keccak256(abi.encodePacked(s1)) == keccak256(abi.encodePacked(""));
	}

}
