from haztrak.hw_track.models import WasteCode

def create_biomedical_waste_categories():
    categories = [
        ("BMW-Y", "Infectious Waste (Yellow)", "Yellow"),
        ("BMW-R", "Contaminated Recyclables (Red)", "Red"),
        ("BMW-B", "Glassware (Blue)", "Blue"),
        ("BMW-W", "Sharps (White)", "White"),
    ]
    for code, desc, color in categories:
        WasteCode.objects.get_or_create(code=code, defaults={"description": desc})
    print("Biomedical waste categories created!")
