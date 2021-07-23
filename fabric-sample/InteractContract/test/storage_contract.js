const StorageContract = artifacts.require("Storage");

contract("StorageContract", function (accounts) {
	let instance;

	beforeEach("Should setup the contract instance", async () => {
		instance = await StorageContract.deployed();
	});

	it("Should return the list of accounts", async () => {
		console.log(accounts);
		return assert.isTrue(true);
	});

	it("Should return the number", async () => {
		const value = await instance.retrieve();
		console.log("Value before: " + value);
		return assert.equal(value, 0);
	});

	it("Should return change the name", async () => {
		await instance.store(2);
		const value = await instance.retrieve();
		console.log("Value after:", 2);
		return assert.equal(value, 2);
	});
});
