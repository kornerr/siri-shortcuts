
enum ApplianceType: Int
{
    case kettle
    case multicooker
    case coffeeMachine
}

func applianceTypeTitles() -> [String]
{
    return [
        NSLocalizedString("Type.Kettle", comment: ""),
        NSLocalizedString("Type.CoffeeMachine", comment: ""),
        NSLocalizedString("Type.Multicooker", comment: ""),
    ]
}

struct Appliance
{
    var type: ApplianceType
    var state: Bool
}

