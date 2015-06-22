// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// SIDE: EAST

// ====================================================================================

// TASKS
// The code below creates tasks. Two (commented-out) sample tasks are included.
// Note: tasks should be entered into this file in reverse order.

// _task2 = player createSimpleTask ["OBJ_2"];
// _task2 setSimpleTaskDescription ["IN DEPTH OBJECTIVE DESCRIPTION", "SHORT OBJECTIVE DESCRIPTION", "WAYPOINT TEXT"];
// _task2 setSimpleTaskDestination WAYPOINTLOCATION;
// _task2 setTaskState "Created";

// _task1 = player createSimpleTask ["OBJ_1"];
// _task1 setSimpleTaskDescription ["IN DEPTH OBJECTIVE DESCRIPTION", "SHORT OBJECTIVE DESCRIPTION", "WAYPOINT TEXT"];
// _task1 setSimpleTaskDestination WAYPOINTLOCATION;
// _task1 setTaskState "Created";

// ====================================================================================

// NOTES: CREDITS
// The code below creates the administration sub-section of notes.

_cre = player createDiaryRecord ["diary", ["Credits","
<br/>
*** Insert mission credits here. ***
<br/>
<br/>Made with F3 (http://www.ferstaberinde.com/f3/en/)
<br/>Mission by: Captainblaffer
<br/>module_performance by: Conroy
<br/>Rooftop Static Weapons Script by: MisterGoodson (aka Goodson)
<br/>Generic Vehicle Service by: Jacmac
<br/>LV AI spawn scripts by: SPUn / lostvar
"]];

// ====================================================================================

// NOTES: ADMINISTRATION
// The code below creates the administration sub-section of notes.

_adm = player createDiaryRecord ["diary", ["Administration","
<br/>
<br/>BLUFOR:
<br/>Do not take Helicopters, IFVs or APCs from the base unless you are a squad leader, pilot, crewman, engineer
<br/>
<br/>OPFOR:
<br/>1 Insurgent for each 8 blufor (If not enough BLUFOR show up at the event please switch to BLUFOR during slotting. If enough people JIP you may swap to OPFOR again)
<br/>
<br/>If you played as insurgent last time, please play as BLUFOR this time.
"]];

// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

//_exe = player createDiaryRecord ["diary", ["Execution","
//"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
<br/>Insurgency: Clear compounds, searching for intel, and blow up the weapons caches.
<br/>
<br/>Respawn enabled. TP to squad, and TP to mobile HQ. Vehicle respawn= ~10 minutes
<br/>
<br/>BLUFOR has 100 respawn tickets. 
<br/>
<br/>Enemies will spawn around the red markers on map. Two weapons caches are split between the fortification markers.
<br/>
<br/>If a third fort marker is present, one will be occupied with an AA or Arty vehicle instead of a weapons cache. 
<br/>
<br/>Once all weapons caches are destroyed new caches and enemies will spawn. Respawn tickets will be reset.
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
<br/>ENEMY FORCES
<br/>
<br/>PA NATO coalition forces
<br/>
<br/>Vehicles:
<br/>3x HEMMT 
<br/>7x STRIDER 
<br/>8x ATV
<br/>
<br/>Air:
<br/>1x TH Huron 
<br/>1x TH Ghosthawk 
<br/>1x AH Littlebird  
<br/>
<br/>Support:	
<br/>2x IFV 
<br/>Service trucks 
<br/>
<br/>@MHQ:
<br/>2x Jackal transport 
<br/>8x ATV
<br/><br/>
<br/>FRIENDLY FORCES
<br/>
<br/>Insurgents, including player controlled. Possible APCs and IFVs 
"]];

// ====================================================================================
