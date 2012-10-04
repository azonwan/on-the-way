<?php

class OpenPNE_KtaiEmoji_Docomo extends OpenPNE_KtaiEmoji_Common
{
    /**
     * constructor
     */
    function OpenPNE_KtaiEmoji_Docomo()
    {
        $this->carrier_id = 'i';
        $this->value_list = array(
            1 => '&#xE63E;',
            2 => '&#xE63F;',
            3 => '&#xE640;',
            4 => '&#xE641;',
            5 => '&#xE642;',
            6 => '&#xE643;',
            7 => '&#xE644;',
            8 => '&#xE645;',
            9 => '&#xE646;',
            10 => '&#xE647;',
            11 => '&#xE648;',
            12 => '&#xE649;',
            13 => '&#xE64A;',
            14 => '&#xE64B;',
            15 => '&#xE64C;',
            16 => '&#xE64D;',
            17 => '&#xE64E;',
            18 => '&#xE64F;',
            19 => '&#xE650;',
            20 => '&#xE651;',
            21 => '&#xE652;',
            22 => '&#xE653;',
            23 => '&#xE654;',
            24 => '&#xE655;',
            25 => '&#xE656;',
            26 => '&#xE657;',
            27 => '&#xE658;',
            28 => '&#xE659;',
            29 => '&#xE65A;',
            30 => '&#xE65B;',
            31 => '&#xE65C;',
            32 => '&#xE65D;',
            33 => '&#xE65E;',
            34 => '&#xE65F;',
            35 => '&#xE660;',
            36 => '&#xE661;',
            37 => '&#xE662;',
            38 => '&#xE663;',
            39 => '&#xE664;',
            40 => '&#xE665;',
            41 => '&#xE666;',
            42 => '&#xE667;',
            43 => '&#xE668;',
            44 => '&#xE669;',
            45 => '&#xE66A;',
            46 => '&#xE66B;',
            47 => '&#xE66C;',
            48 => '&#xE66D;',
            49 => '&#xE66E;',
            50 => '&#xE66F;',
            51 => '&#xE670;',
            52 => '&#xE671;',
            53 => '&#xE672;',
            54 => '&#xE673;',
            55 => '&#xE674;',
            56 => '&#xE675;',
            57 => '&#xE676;',
            58 => '&#xE677;',
            59 => '&#xE678;',
            60 => '&#xE679;',
        );
    }

    function &getInstance()
    {
        static $singleton;
        if (empty($singleton)) {
            $singleton = new OpenPNE_KtaiEmoji_Docomo();
        }
        return $singleton;
    }
}

?>
