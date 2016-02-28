/*
*****************************************
*Map Labels*
*by Hazel (hazel16 @ CivFanatics)*
*****************************************
*/

INSERT INTO IconFontTextures
(IconFontTexture, IconFontTextureFile)
SELECT 'ICON_ML_MAP', 'ML_MapIcons' UNION ALL
SELECT 'ICON_ML_MAP2', 'ML_MapIcons2';

INSERT INTO IconFontMapping
(IconName,IconFontTexture,IconMapping)
SELECT 'ICON_ML_COAST', 'ICON_ML_MAP', 1 UNION ALL
SELECT 'ICON_ML_DESERT', 'ICON_ML_MAP', 2 UNION ALL
SELECT 'ICON_ML_FLOODPLAIN', 'ICON_ML_MAP', 3 UNION ALL
SELECT 'ICON_ML_FOREST', 'ICON_ML_MAP', 4 UNION ALL
SELECT 'ICON_ML_GRASSLAND', 'ICON_ML_MAP', 5 UNION ALL
SELECT 'ICON_ML_HILLS', 'ICON_ML_MAP', 6 UNION ALL
SELECT 'ICON_ML_ICE', 'ICON_ML_MAP', 7 UNION ALL
SELECT 'ICON_ML_JUNGLE', 'ICON_ML_MAP', 8 UNION ALL
SELECT 'ICON_ML_RIVER2', 'ICON_ML_MAP', 9 UNION ALL
SELECT 'ICON_ML_MOUNTAIN', 'ICON_ML_MAP', 10 UNION ALL
SELECT 'ICON_ML_LAKE', 'ICON_ML_MAP', 11 UNION ALL
SELECT 'ICON_ML_OCEAN', 'ICON_ML_MAP', 12 UNION ALL
SELECT 'ICON_ML_YELLOW', 'ICON_ML_MAP', 13 UNION ALL
SELECT 'ICON_ML_RIVER', 'ICON_ML_MAP', 14 UNION ALL
SELECT 'ICON_ML_COAST2', 'ICON_ML_MAP', 15 UNION ALL
SELECT 'ICON_ML_SNOW', 'ICON_ML_MAP', 16 UNION ALL
SELECT 'ICON_ML_RUINS', 'ICON_ML_MAP', 17 UNION ALL
SELECT 'ICON_ML_FALLOUT', 'ICON_ML_MAP', 18 UNION ALL
SELECT 'ICON_ML_BW_FOREST', 'ICON_ML_MAP', 19 UNION ALL
SELECT 'ICON_ML_BW_DESERT', 'ICON_ML_MAP', 20 UNION ALL
SELECT 'ICON_ML_BW_MOUNTAINS', 'ICON_ML_MAP', 21 UNION ALL
SELECT 'ICON_ML_SAILBOAT', 'ICON_ML_MAP', 22 UNION ALL
SELECT 'ICON_ML_SPARK', 'ICON_ML_MAP', 23 UNION ALL
SELECT 'ICON_ML_FLAME', 'ICON_ML_MAP', 24 UNION ALL
SELECT 'ICON_ML_TREE', 'ICON_ML_MAP', 25 UNION ALL
SELECT 'ICON_ML_TENT', 'ICON_ML_MAP', 26 UNION ALL
SELECT 'ICON_ML_BELL', 'ICON_ML_MAP', 27 UNION ALL
SELECT 'ICON_ML_WHEEL', 'ICON_ML_MAP', 28 UNION ALL
SELECT 'ICON_ML_ANCHOR', 'ICON_ML_MAP', 29 UNION ALL
SELECT 'ICON_ML_SHIELD', 'ICON_ML_MAP', 30 UNION ALL
SELECT 'ICON_ML_LOCK', 'ICON_ML_MAP', 31 UNION ALL
--SELECT 'ICON_ML_TARGET2', 'ICON_ML_MAP', 32 UNION ALL
SELECT 'ICON_ML_BOOK', 'ICON_ML_MAP', 33 UNION ALL
SELECT 'ICON_ML_SCROLL', 'ICON_ML_MAP', 34 UNION ALL
SELECT 'ICON_ML_SKULL', 'ICON_ML_MAP', 35 UNION ALL
SELECT 'ICON_ML_SKULL2', 'ICON_ML_MAP', 36 UNION ALL
SELECT 'ICON_ML_WHEEL2', 'ICON_ML_MAP', 37 UNION ALL
SELECT 'ICON_ML_TARGET2', 'ICON_ML_MAP', 38 UNION ALL
SELECT 'ICON_ML_CROSS2', 'ICON_ML_MAP', 39 UNION ALL
SELECT 'ICON_ML_MOON', 'ICON_ML_MAP', 40 UNION ALL
SELECT 'ICON_ML_LION', 'ICON_ML_MAP', 41 UNION ALL
SELECT 'ICON_ML_CROWN', 'ICON_ML_MAP', 42 UNION ALL
SELECT 'ICON_ML_COATOFARMS', 'ICON_ML_MAP', 43 UNION ALL
SELECT 'ICON_ML_COATOFARMS2', 'ICON_ML_MAP', 44 UNION ALL
SELECT 'ICON_ML_COATOFARMS3', 'ICON_ML_MAP', 45 UNION ALL
SELECT 'ICON_ML_COATOFARMS4', 'ICON_ML_MAP', 46 UNION ALL
SELECT 'ICON_ML_STAR', 'ICON_ML_MAP', 47 UNION ALL
SELECT 'ICON_ML_STAR2', 'ICON_ML_MAP', 48 UNION ALL
SELECT 'ICON_ML_ONE', 'ICON_ML_MAP', 49 UNION ALL
SELECT 'ICON_ML_TWO', 'ICON_ML_MAP', 50 UNION ALL
SELECT 'ICON_ML_THREE', 'ICON_ML_MAP', 51 UNION ALL
SELECT 'ICON_ML_FOUR', 'ICON_ML_MAP', 52 UNION ALL
SELECT 'ICON_ML_FIVE', 'ICON_ML_MAP', 53 UNION ALL
SELECT 'ICON_ML_SIX', 'ICON_ML_MAP', 54 UNION ALL
SELECT 'ICON_ML_SEVEN', 'ICON_ML_MAP', 55 UNION ALL
SELECT 'ICON_ML_EIGHT', 'ICON_ML_MAP', 56 UNION ALL
SELECT 'ICON_ML_BLUEBUTTON', 'ICON_ML_MAP', 57 UNION ALL
SELECT 'ICON_ML_GREENBUTTON', 'ICON_ML_MAP', 58 UNION ALL
SELECT 'ICON_ML_REDBUTTON', 'ICON_ML_MAP', 59 UNION ALL
SELECT 'ICON_ML_ORANGEBUTTON', 'ICON_ML_MAP', 60 UNION ALL
SELECT 'ICON_ML_BLACKBUTTON', 'ICON_ML_MAP', 61 UNION ALL
SELECT 'ICON_ML_UP', 'ICON_ML_MAP', 62 UNION ALL
SELECT 'ICON_ML_DOWN', 'ICON_ML_MAP', 63 UNION ALL
SELECT 'ICON_ML_SHIELD2', 'ICON_ML_MAP', 64 UNION ALL
SELECT 'ICON_ML_CIRCLE', 'ICON_ML_MAP', 65 UNION ALL
SELECT 'ICON_ML_GEM', 'ICON_ML_MAP', 66 UNION ALL
SELECT 'ICON_ML_TRIANGLE', 'ICON_ML_MAP', 67 UNION ALL
SELECT 'ICON_ML_CAPITAL', 'ICON_ML_MAP', 68 UNION ALL
SELECT 'ICON_ML_DIGSITE', 'ICON_ML_MAP', 69 UNION ALL
SELECT 'ICON_ML_TARGET', 'ICON_ML_MAP', 70 UNION ALL
SELECT 'ICON_ML_EDIT', 'ICON_ML_MAP', 71 UNION ALL
SELECT 'ICON_ML_COG', 'ICON_ML_MAP', 72 UNION ALL
SELECT 'ICON_ML_MAGNIFYINGGLASS', 'ICON_ML_MAP', 73 UNION ALL
SELECT 'ICON_ML_WORLD', 'ICON_ML_MAP', 74 UNION ALL
SELECT 'ICON_ML_WORLD2', 'ICON_ML_MAP', 75 UNION ALL
SELECT 'ICON_ML_WORLD3', 'ICON_ML_MAP', 76 UNION ALL
SELECT 'ICON_ML_X', 'ICON_ML_MAP', 77 UNION ALL
SELECT 'ICON_ML_X2', 'ICON_ML_MAP', 78 UNION ALL
SELECT 'ICON_ML_PLUS', 'ICON_ML_MAP', 79 UNION ALL
SELECT 'ICON_ML_MINUS', 'ICON_ML_MAP', 80 UNION ALL
SELECT 'ICON_ML_QUESTION', 'ICON_ML_MAP', 81 UNION ALL
SELECT 'ICON_ML_X3', 'ICON_ML_MAP', 82 UNION ALL
SELECT 'ICON_ML_CHECK', 'ICON_ML_MAP', 83 UNION ALL
SELECT 'ICON_ML_X4', 'ICON_ML_MAP', 84 UNION ALL
SELECT 'ICON_ML_X5', 'ICON_ML_MAP', 85 UNION ALL
SELECT 'ICON_ML_EXCLAMATION', 'ICON_ML_MAP', 86 UNION ALL
SELECT 'ICON_ML_EXCLAMATION2', 'ICON_ML_MAP', 87 UNION ALL
SELECT 'ICON_ML_EXCLAMATION3', 'ICON_ML_MAP', 88;

INSERT INTO IconFontMapping
(IconName,IconFontTexture,IconMapping)
SELECT 'ICON_ML_PIN1', 'ICON_ML_MAP2', 1 UNION ALL
SELECT 'ICON_ML_PIN2', 'ICON_ML_MAP2', 2 UNION ALL
SELECT 'ICON_ML_PIN3', 'ICON_ML_MAP2', 3 UNION ALL
SELECT 'ICON_ML_PIN4', 'ICON_ML_MAP2', 4 ;