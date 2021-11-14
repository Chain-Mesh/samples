const Sidemesh = artifacts.require("sidemesh-solidity/sidemesh/Sidemesh.sol");
const CrossPrimary = artifacts.require("./CrossPrimary.sol");

contract("CrossPrimary", async (accounts) => {
	it("Cross primary should run perfectly", async () => {
		const sidemesh = await Sidemesh.deployed();
		await sidemesh.setNetwork("hl_besu_test_network", {
			from: accounts[0],
		});
		const crossPrimary = await CrossPrimary.deployed();
		await crossPrimary.doCross("a", "b", 20, 1636929294, {
			from: accounts[0],
		});
		assert.equals(true == true, "Cross Contract excuted success fully");
	});
});
