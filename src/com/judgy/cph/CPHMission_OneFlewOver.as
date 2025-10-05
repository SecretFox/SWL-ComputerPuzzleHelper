import com.GameInterface.MathLib.Vector3;
import com.judgy.cph.CPHMission_Base;
import com.judgy.cph.CPHMissionTextFilter;
import com.Utils.LDBFormat;
import mx.utils.Delegate;

class com.judgy.cph.CPHMission_OneFlewOver extends CPHMission_Base
{
	
	private function DoLoad() {
		var ldbText:String;
		var ldbAnswer:String;
		
	// There' atleast 3 computers with text "Morninglight Control System: Observation Station" on the area
	// Area check is easy way to tell them apart
		
	// computer 1
		// After opening cage from 3rd screen
		ldbText = LDBFormat.LDBGetText(50002, 31022); // opening cage
		ldbText = CPHMissionTextFilter.filterGameActionText(ldbText);
		addTextAnswer( ldbText, "quit", true);
	
		// 1st screen
		var f = Delegate.create(this, function()
		{
			return this.areaCheck(new Vector3(588, 87, 392), 10);
		})
		ldbText = LDBFormat.LDBGetText(50002, 31056);
		ldbText = CPHMissionTextFilter.filterHelpQuitText(ldbText);
		addTextAnswer( ldbText, "3", true, f);
		
		// 2nd screen
		ldbText = LDBFormat.LDBGetText(50002, 31012);
		addTextAnswer(ldbText, "1", true);
		
		// 3rd screen
		ldbText = LDBFormat.LDBGetText(50002, 31014);
		ldbAnswer = LDBFormat.LDBGetText(50001, 20615);
		ldbAnswer = CPHMissionTextFilter.filterHiddenAnswerText(ldbAnswer);
		addTextAnswer(ldbText, ldbAnswer, false);
		
	// Computer 2
		f = Delegate.create(this, function()
		{
			return this.areaCheck(new Vector3(471, 87, 391), 10);
		})
		ldbText = LDBFormat.LDBGetText(50002, 31056);
		ldbText = CPHMissionTextFilter.filterHelpQuitText(ldbText);
		addTextAnswer( ldbText, "2", true, f);
		//First computer prompts actually handle the rest
	}
	
	public function areaCheck(target:Vector3, tolerance:Number) 
	{
		var pos:Vector3 = com.GameInterface.Game.Character.GetClientCharacter().GetPosition();
		var distance = Vector3.Sub(target, pos).Len();
		return distance < tolerance;
	}
	
	public function GetDVName() {
		return "OneFlewOver";
	}
	
	public function IsValidPlayfield(playfield:Number) {
		return playfield == 2025;
	}
	
	public function GetQuestID() {
		return 4077;
	}
}