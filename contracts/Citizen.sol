pragma solidity >=0.4.25 <0.9.0;

contract Citizen {
	address public govMinter;
	address[] public peoples;
    mapping (address => Person) public people;
	mapping (uint => address) public zombieToOwner;
	event NewRegister(address person, string firstname, string lastName);

	function register(string memory _firstName, string memory _lastName, uint _dob, address _father, address _mother) public returns (address) {
		address person = address(new Person(_firstName, _lastName, _dob, _father, _mother));
		peoples.push(person);
		emit NewRegister(person, _firstName, _lastName);
        return person;
	}
}

contract Person {
	enum Status { live, dead }
	enum Gender { Male, Female }
	// address ownerSecret; hash key
	string firstName;
	string lastName;
	uint dob;
	// Gender gender;
	// Status status;
	address father;
	address mother;
	// address addressNumber;
	// uint idNumber;

	constructor(string memory _firstName, string memory _lastName, uint _dob, address _father, address _mother) public {
		firstName = _firstName;
		lastName = _lastName;
		dob = _dob;
		father = _father;
		mother = _mother;
	}
}

