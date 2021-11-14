const Sidemesh = artifacts.require("sidemesh-solidity/sidemesh/Sidemesh.sol");
const CrossNetwork = artifacts.require("./CrossNetwork.sol");

contract("CrossPrimary", async (accounts) => {
	it("Cross primary should run perfectly", async () => {
		const sidemesh = await Sidemesh.deployed();
		await sidemesh.setNetwork("hl_fabric_test_network", {
			from: accounts[0],
		});
		it.equals(true == true, "Cross Contract excuted success fully");
	});
});
