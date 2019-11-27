
enum ApplianceType: String
{
    case kettle = "Kettle"
    case multicooker = "Multicooker"
    case coffeeMachine = "Coffee machine"
}

struct Appliance
{
    var type: ApplianceType
    var state: Bool
}

