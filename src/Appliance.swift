
enum ApplianceType: String
{
    case kettle = "Type.Kettle"
    case multicooker = "Type.Multicooker"
    case coffeeMachine = "Type.CoffeeMachine"
}

struct Appliance
{
    var type: ApplianceType
    var state: Bool
}

