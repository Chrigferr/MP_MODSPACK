--=======================================================================================================================
-- Civilizations_YagemStartPosition
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,									X,		Y,		AltX,	AltY)
SELECT		('CIVILIZATION_JFD_FRANCE_DEGAULLE'),	X,		Y,		AltX,	AltY
FROM Civilizations_YagemStartPosition WHERE Type = 'CIVILIZATION_FRANCE';
--=======================================================================================================================
-- Civilizations_YahemStartPosition
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,									X,		Y,		AltX,	AltY)
SELECT		('CIVILIZATION_JFD_FRANCE_DEGAULLE'),	X,		Y,		AltX,	AltY
FROM Civilizations_YahemStartPosition WHERE Type = 'CIVILIZATION_FRANCE';
--=======================================================================================================================
-- Civilizations_CordiformStartPosition
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,									X,		Y,		AltX,	AltY)
SELECT		('CIVILIZATION_JFD_FRANCE_DEGAULLE'),	X,		Y,		AltX,	AltY
FROM Civilizations_CordiformStartPosition WHERE Type = 'CIVILIZATION_FRANCE';
--=======================================================================================================================
-- Civilizations_GreatestEarthStartPosition
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,									X,		Y,		AltX,	AltY)
SELECT		('CIVILIZATION_JFD_FRANCE_DEGAULLE'),	X,		Y,		AltX,	AltY
FROM Civilizations_GreatestEarthStartPosition WHERE Type = 'CIVILIZATION_FRANCE';
--=======================================================================================================================
-- Civilizations_EuroGiantStartPosition
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
			(Type,									X,		Y,		AltX,	AltY)
SELECT		('CIVILIZATION_JFD_FRANCE_DEGAULLE'),	X,		Y,		AltX,	AltY
FROM Civilizations_EuroGiantStartPosition WHERE Type = 'CIVILIZATION_FRANCE';
--=======================================================================================================================
-- Civilizations_EuroLargeStartPosition
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
			(Type,									X,		Y,		AltX,	AltY)
SELECT		('CIVILIZATION_JFD_FRANCE_DEGAULLE'),	X,		Y,		AltX,	AltY
FROM Civilizations_EuroLargeStartPosition WHERE Type = 'CIVILIZATION_FRANCE';
--=======================================================================================================================
-- Civilizations_NorthAtlanticStartPosition
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAtlanticStartPosition
			(Type,									X,		Y,		AltX,	AltY)
SELECT		('CIVILIZATION_JFD_FRANCE_DEGAULLE'),	X,		Y,		AltX,	AltY
FROM Civilizations_NorthAtlanticStartPosition WHERE Type = 'CIVILIZATION_FRANCE';
--=======================================================================================================================
-- Civilizations_NorthWestEuropeStartPosition
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthWestEuropeStartPosition
			(Type,									X,		Y,		AltX,	AltY)
SELECT		('CIVILIZATION_JFD_FRANCE_DEGAULLE'),	X,		Y,		AltX,	AltY
FROM Civilizations_NorthWestEuropeStartPosition WHERE Type = 'CIVILIZATION_FRANCE';
--=======================================================================================================================
-- Civilizations_CaribbeanStartPosition
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_CaribbeanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CaribbeanStartPosition
			(Type,									X,		Y,		AltX,	AltY)
SELECT		('CIVILIZATION_JFD_FRANCE_DEGAULLE'),	X,		Y,		AltX,	AltY
FROM Civilizations_CaribbeanStartPosition WHERE Type = 'CIVILIZATION_FRANCE';
--=======================================================================================================================
-- Civilizations_MediterraneanStartPosition
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MediterraneanStartPosition
			(Type,									X,		Y,		AltX,	AltY)
SELECT		('CIVILIZATION_JFD_FRANCE_DEGAULLE'),	X,		Y,		AltX,	AltY
FROM Civilizations_MediterraneanStartPosition WHERE Type = 'CIVILIZATION_FRANCE';
--=======================================================================================================================
-- Civilizations_AmericasStartPosition
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_AmericasStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AmericasStartPosition
			(Type,									X,		Y,		AltX,	AltY)
SELECT		('CIVILIZATION_JFD_FRANCE_DEGAULLE'),	X,		Y,		AltX,	AltY
FROM Civilizations_AmericasStartPosition WHERE Type = 'CIVILIZATION_FRANCE';
--=======================================================================================================================
-- Civilizations_YagemRequestedResource
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_FRANCE_DEGAULLE'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_FRANCE';
--=======================================================================================================================
-- Civilizations_YahemRequestedResource
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_FRANCE_DEGAULLE'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_FRANCE';
--=======================================================================================================================
-- Civilizations_GreatestEarthRequestedResource
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_FRANCE_DEGAULLE'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_FRANCE';
--=======================================================================================================================
-- Civilizations_EuroGiantRequestedResource
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_FRANCE_DEGAULLE'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroGiantRequestedResource WHERE Type = 'CIVILIZATION_FRANCE';
--=======================================================================================================================
-- Civilizations_EuroLargeRequestedResource
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_FRANCE_DEGAULLE'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_FRANCE';
--=======================================================================================================================
-- Civilizations_AmericasRequestedResource
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_AmericasRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AmericasRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_FRANCE_DEGAULLE'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_AmericasRequestedResource WHERE Type = 'CIVILIZATION_FRANCE';
--=======================================================================================================================
-- Civilizations_CaribbeanRequestedResource
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_CaribbeanRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_CaribbeanRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_FRANCE_DEGAULLE'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_CaribbeanRequestedResource WHERE Type = 'CIVILIZATION_FRANCE';
--=======================================================================================================================
-- Civilizations_NorthAtlanticRequestedResource
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAtlanticRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_FRANCE_DEGAULLE'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthAtlanticRequestedResource WHERE Type = 'CIVILIZATION_FRANCE';
--=======================================================================================================================
--=======================================================================================================================