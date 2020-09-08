pragma solidity ^0.5.0;

import "./storage.sol";

/* Kovan Assimilators set one - holding reserves in dai, usdc, usdt and susd */
import "../../assimilators/kovan/daiReserves/kovanDaiToDaiAssimilator.sol";
import "../../assimilators/kovan/daiReserves/kovanCDaiToDaiAssimilator.sol";
import "../../assimilators/kovan/daiReserves/kovanChaiToDaiAssimilator.sol";
import "../../assimilators/kovan/usdcReserves/kovanUsdcToUsdcAssimilator.sol";
import "../../assimilators/kovan/usdcReserves/kovanCUsdcToUsdcAssimilator.sol";
import "../../assimilators/kovan/susdReserves/kovanSUsdToSUsdAssimilator.sol";
import "../../assimilators/kovan/susdReserves/kovanASUsdToSUsdAssimilator.sol";
import "../../assimilators/kovan/usdtReserves/kovanUsdtToUsdtAssimilator.sol";
import "../../assimilators/kovan/usdtReserves/kovanAUsdtToUsdtAssimilator.sol";

/* Mainnet Assimilators set one - holding reserves in cDai, cUsdc, aUsdt and aSusd */
import "../../assimilators/mainnet/daiReserves/mainnetDaiToDaiAssimilator.sol";
import "../../assimilators/mainnet/daiReserves/mainnetCDaiToDaiAssimilator.sol";
import "../../assimilators/mainnet/daiReserves/mainnetChaiToDaiAssimilator.sol";
import "../../assimilators/mainnet/usdcReserves/mainnetUsdcToUsdcAssimilator.sol";
import "../../assimilators/mainnet/usdcReserves/mainnetCUsdcToUsdcAssimilator.sol";
import "../../assimilators/mainnet/susdReserves/mainnetSUsdToSUsdAssimilator.sol";
import "../../assimilators/mainnet/susdReserves/mainnetASUsdToSUsdAssimilator.sol";
import "../../assimilators/mainnet/usdtReserves/mainnetUsdtToUsdtAssimilator.sol";
import "../../assimilators/mainnet/usdtReserves/mainnetAUsdtToUsdtAssimilator.sol";

/* Mainnet Assimilators set two - holding reserves in cDai, cUsdc, aUsdt and aSusd */
import "../../assimilators/mainnet/cdaiReserves/mainnetDaiToCDaiAssimilator.sol";
import "../../assimilators/mainnet/cdaiReserves/mainnetCDaiToCDaiAssimilator.sol";
import "../../assimilators/mainnet/cdaiReserves/mainnetChaiToCDaiAssimilator.sol";
import "../../assimilators/mainnet/cusdcReserves/mainnetUsdcToCUsdcAssimilator.sol";
import "../../assimilators/mainnet/cusdcReserves/mainnetCUsdcToCUsdcAssimilator.sol";
import "../../assimilators/mainnet/asusdReserves/mainnetSUsdToASUsdAssimilator.sol";
import "../../assimilators/mainnet/asusdReserves/mainnetASUsdToASUsdAssimilator.sol";
import "../../assimilators/mainnet/ausdtReserves/mainnetUsdtToAUsdtAssimilator.sol";
import "../../assimilators/mainnet/ausdtReserves/mainnetAUsdtToAUsdtAssimilator.sol";

contract AssimilatorSetup is StorageSetup {

    event log_bytes(bytes32, bytes4);
    
    function setupAssimilatorsSetOneKovan () public {

        usdcAssimilator = IAssimilator(address(new KovanUsdcToUsdcAssimilator()));
        cusdcAssimilator = IAssimilator(address(new KovanCUsdcToUsdcAssimilator()));

        daiAssimilator = IAssimilator(address(new KovanDaiToDaiAssimilator()));
        cdaiAssimilator = IAssimilator(address(new KovanCDaiToDaiAssimilator()));
        chaiAssimilator = IAssimilator(address(new KovanChaiToDaiAssimilator()));

        usdtAssimilator = IAssimilator(address(new KovanUsdtToUsdtAssimilator()));
        ausdtAssimilator = IAssimilator(address(new KovanAUsdtToUsdtAssimilator()));

        susdAssimilator = IAssimilator(address(new KovanSUsdToSUsdAssimilator()));
        asusdAssimilator = IAssimilator(address(new KovanASUsdToSUsdAssimilator()));

    }

    function setupAssimilatorsSetOneMainnet () public {

        usdcAssimilator = IAssimilator(address(new MainnetUsdcToCUsdcAssimilator()));
        cusdcAssimilator = IAssimilator(address(new MainnetCUsdcToCUsdcAssimilator()));

        daiAssimilator = IAssimilator(address(new MainnetDaiToCDaiAssimilator()));
        cdaiAssimilator = IAssimilator(address(new MainnetCDaiToCDaiAssimilator()));
        chaiAssimilator = IAssimilator(address(new MainnetChaiToCDaiAssimilator()));

        usdtAssimilator = IAssimilator(address(new MainnetUsdtToAUsdtAssimilator()));
        ausdtAssimilator = IAssimilator(address(new MainnetAUsdtToAUsdtAssimilator()));

        susdAssimilator = IAssimilator(address(new MainnetSUsdToASUsdAssimilator()));
        asusdAssimilator = IAssimilator(address(new MainnetASUsdToASUsdAssimilator()));

    }

    function setupDeployedAssimilatorsMainnet () public {

        usdcAssimilator = IAssimilator(0x54B7b567bc634E19632A8E85EEaE4EAE955ae9f9);
        cusdcAssimilator = IAssimilator(0xf5AB3FFD9F92893cAf1CBCcEC01b1c6EaA140C3f);

        daiAssimilator = IAssimilator(0x9E77104724A8390b6f2e80E222B5E8fe7eb7383f);
        cdaiAssimilator = IAssimilator(0xaEb74F5a22935FB6c812395c3e2fE2F5258c8d6E);
        chaiAssimilator = IAssimilator(0x21C09C793cc94c964D76cEC0A80D2cC61f155375);

        usdtAssimilator = IAssimilator(0xCd0dA368E6e32912DD6633767850751969346d15);
        ausdtAssimilator = IAssimilator(0xA4906F20a7806ca28626d3D607F9a594f1B9ed3B);

        susdAssimilator = IAssimilator(0x4CB5174C962a40177876799836f353e8E9c4eF75);
        asusdAssimilator = IAssimilator(0x68747564d7B4e7b654BE26D09f60f7756Cf54BF8);

    }

}