pragma solidity ^0.5.0;

import "../../Loihi.sol";

import "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";
import "openzeppelin-contracts/contracts/token/ERC20/IERC20NoBool.sol";

import "./storage.sol";

contract ApproveFrom {
    function safeApprove(address _token, address _spender, uint256 _value) public;
}

contract LoihiSetup is StorageSetup {

    event log_uint(bytes32, uint256);

    function setParamsSetOne (Loihi _loihi) public {

        uint256 _alpha = .5e18;
        uint256 _beta = .25e18;
        uint256 _max = .5e18;
        uint256 _epsilon = 2.5e14;
        uint256 _lambda = .2e18;

        emit log_uint("_alpha", _alpha);
        emit log_uint("_beta", _beta);
        emit log_uint("_max", _max);
        emit log_uint("_epsilon", _epsilon);
        emit log_uint("_lambda", _lambda);

        _loihi.setParams(_alpha, _beta, _max, _epsilon, _lambda, 0);

    }

    function setParamsSetTwo (Loihi _loihi) public {

       uint256 _alpha = .5e18;
       uint256 _beta = .25e18;
       uint256 _max = .05e18;
       uint256 _epsilon = 5e14;
       uint256 _lambda = .2e18;

       _loihi.setParams(_alpha, _beta, _max, _epsilon, _lambda, 0);

    }

    function setParamsSetThree (Loihi _loihi) public {

        uint256 _alpha = .5e18;
        uint256 _beta = .25e18;
        uint256 _max = .05e18;
        uint256 _epsilon = 0;
        uint256 _lambda = 1e18;

        _loihi.setParams(_alpha, _beta, _max, _epsilon, _lambda, 0);

    }

    function setParamsSetFour (Loihi _loihi) public {

        uint256 _alpha = .5e18;
        uint256 _beta = .48e18;
        uint256 _max = .49e18;
        uint256 _epsilon = 2.5e14;
        uint256 _lambda = .2e18;
        emit log_uint("_alpha", _alpha);
        emit log_uint("_beta", _beta);
        emit log_uint("_max", _max);
        emit log_uint("_epsilon", _epsilon);
        emit log_uint("_lambda", _lambda);


        _loihi.setParams(_alpha, _beta, _max, _epsilon, _lambda, 0);

    }

    function includeAssimilatorsSetOne (Loihi _loihi) public {

        _loihi.includeAssimilator(address(dai), address(chai), address(chaiAssimilator));
        _loihi.includeAssimilator(address(dai), address(cdai), address(cdaiAssimilator));

        _loihi.includeAssimilator(address(usdc), address(cusdc), address(cusdcAssimilator));

        _loihi.includeAssimilator(address(usdt), address(ausdt), address(ausdtAssimilator));

        _loihi.includeAssimilator(address(susd), address(asusd), address(asusdAssimilator));

    }

    function includeAssimilatorsSetTwo (Loihi _loihi) public {

        _loihi.includeAssimilator(address(dai), address(chai), address(chaiAssimilator));

    }

    function includeAssetsSetOne (Loihi _loihi) public {

        _loihi.includeAsset(address(dai), address(daiAssimilator), address(dai), address(daiAssimilator), .3e18);
        _loihi.includeAsset(address(usdc), address(usdcAssimilator), address(usdc), address(usdcAssimilator), .3e18);
        _loihi.includeAsset(address(usdt), address(usdtAssimilator), address(usdt), address(usdtAssimilator), .3e18);
        _loihi.includeAsset(address(susd), address(susdAssimilator), address(susd), address(susdAssimilator), .1e18);

    }

    function includeAssetsSetTwo (Loihi _loihi) public {

        _loihi.includeAsset(address(dai), address(daiAssimilator), address(cdai), address(cdaiAssimilator), .3e18);
        _loihi.includeAsset(address(usdc), address(usdcAssimilator), address(cusdc), address(cusdcAssimilator), .3e18);
        _loihi.includeAsset(address(usdt), address(usdtAssimilator), address(ausdt), address(ausdtAssimilator), .3e18);
        _loihi.includeAsset(address(susd), address(susdAssimilator), address(asusd), address(asusdAssimilator), .1e18);

    }

    function includeAssetsSetThree (Loihi _loihi) public {

        _loihi.includeAsset(address(dai), address(daiAssimilator), address(dai), address(daiAssimilator), 333333333333333333);
        _loihi.includeAsset(address(usdc), address(usdcAssimilator), address(usdc), address(usdcAssimilator), 333333333333333333);
        _loihi.includeAsset(address(usdt), address(usdtAssimilator), address(usdt), address(usdtAssimilator), 333333333333333333);

    }

    function includeAssetsSetFour (Loihi _loihi) public {

        _loihi.includeAsset(address(dai), address(daiAssimilator), address(cdai), address(cdaiAssimilator), 333333333333333333);
        _loihi.includeAsset(address(usdc), address(usdcAssimilator), address(cusdc), address(cusdcAssimilator), 333333333333333333);
        _loihi.includeAsset(address(usdt), address(usdtAssimilator), address(ausdt), address(ausdtAssimilator), 333333333333333333);

    }

    function approveStablecoins (address _approveTo) public {

        approve(address(dai), _approveTo);
        approve(address(chai), _approveTo);
        approve(address(cdai), _approveTo);

        approve(address(usdc), _approveTo);
        approve(address(cusdc), _approveTo);

        approveBad(address(usdt), _approveTo);
        approve(address(ausdt), _approveTo);

        approve(address(susd), _approveTo);
        approve(address(asusd), _approveTo);

    }

    function interApproveStablecoinsLocal (address _approveFrom) public {

        address[] memory targets = new address[](5);
        address[] memory spenders = new address[](5);
        targets[0] = address(dai); spenders[0] = address(chai);
        targets[1] = address(dai); spenders[1] = address(cdai);
        targets[2] = address(susd); spenders[2] = address(asusd);
        targets[3] = address(usdc); spenders[3] = address(cusdc);
        targets[4] = address(usdt); spenders[4] = address(ausdt);

        for (uint i = 0; i < targets.length; i++) {
            ApproveFrom(_approveFrom).safeApprove(targets[i], spenders[i], uint256(0));
            ApproveFrom(_approveFrom).safeApprove(targets[i], spenders[i], uint256(-1));
        }

    }

    function interApproveStablecoinsRPC (address _approveFrom) public {

        address[] memory targets = new address[](5);
        address[] memory spenders = new address[](5);
        targets[0] = address(dai); spenders[0] = address(chai);
        targets[1] = address(dai); spenders[1] = address(cdai);
        targets[2] = address(susd); spenders[2] = aaveLpCore;
        targets[3] = address(usdc); spenders[3] = address(cusdc);
        targets[4] = address(usdt); spenders[4] = aaveLpCore;

        for (uint i = 0; i < targets.length; i++) {
            ApproveFrom(_approveFrom).safeApprove(targets[i], spenders[i], uint256(0));
            ApproveFrom(_approveFrom).safeApprove(targets[i], spenders[i], uint256(-1));
        }

    }

    function approve (address token, address l) public {
        uint256 approved = IERC20(token).allowance(address(this), l);
        if (approved > 0) IERC20(token).approve(l, 0);
        IERC20(token).approve(l, uint256(-1));
    }

    function approveBad (address token, address l) public {
        uint256 approved = IERC20NoBool(token).allowance(address(this), l);
        if (approved > 0) IERC20NoBool(token).approve(l, 0);
        IERC20NoBool(token).approve(l, uint256(-1));
    }


}