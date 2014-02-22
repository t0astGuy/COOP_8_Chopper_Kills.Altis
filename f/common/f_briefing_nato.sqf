// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: NATO

// ====================================================================================

// TASKS
// The code below creates tasks. A (commented-out) sample task is included.

// _task1 = player createSimpleTask ["OBJ_1"];
// _task1 setSimpleTaskDescription ["IN DEPTH OBJECTIVE DESCRIPTION", "SHORT OBJECTIVE DESCRIPTION", "WAYPOINT TEXT"];
// _task1 setSimpleTaskDestination WAYPOINTLOCATION;
// _task1 setTaskState "Created";

// ====================================================================================

// NOTES: CREDITS
// The code below creates the administration sub-section of notes.

_cre = player createDiaryRecord ["diary", ["Credits","
<br/>
Made by DoveBalls with help from the Black [sh33p].
<br/><br/>
Made with F3 (http://www.ferstaberinde.com/f3/en/)
"]];

// ====================================================================================

// NOTES: ADMINISTRATION
// The code below creates the administration sub-section of notes.

_adm = player createDiaryRecord ["diary", ["Administration","
<br/>
No additional administration notes.
"]];

// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

_exe = player createDiaryRecord ["diary", ["Execution","
<br/>
COMMANDER'S INTENT
<br/>
We need to clear the town of all hostiles.  Avoid civilian casualties where possible.
<br/><br/>
MOVEMENT PLAN
<br/>
Fly carefully, avoiding enemy towns and potential hot spots for AA.  Set down and proceed on foot if necessary.
<br/><br/>
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
Your mission is to kill all enemies using a gunship before landing in the area once cleared.
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
Enemies have dug in and are occupying a nearby city on Altis.  We must clear them out.
<br/><br/>
ENEMY FORCES
<br/>
Intel suggestions enemy forces could be as few as a single fire team, or as many as an entire platoon.<br />
In addition to that, we have just received more intel that there are enemy attack helo's and armored vehicles on the ground.  Use extreme caution!
<br/><br/>
FRIENDLY FORCES
<br/>
We have a series of attack helicopters from the various factions at our disposal.
"]];

// ====================================================================================