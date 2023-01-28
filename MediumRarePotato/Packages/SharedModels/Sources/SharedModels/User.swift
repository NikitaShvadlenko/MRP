public struct User: Codable {
    let id: String
    let walletName: String
    let withdrawFeeMRP: Double
    let withdrawFeeMRB: Double
    let karmaParams: KarmaParams
    let stakeParams: StakeParams
    let stakeLevel: Int
    let apiKey: String
    let gameBalance: String
    let claimAmount: Double
    let balanceMRP: Double
    let balanceMRB: Double
    let lastWithdraw: String
    let lastWithdrawMRB: String
    let isBanned: Bool
    let created: String
    let updated: String
}

struct KarmaParams: Codable {
    let totalPurchases: Double
    let totalPurchasesMRB: Double
    let totalWithdrawn: Double
    let totalDeposit: Double
    let karmaModifier: Double
    let karmaPercent: Int
    let karmaPercentCategory: Int
    let initialWithdrawFee: Int
}

struct StakeParams: Codable {
    let stakeLevel: Int
    let totalStaked: Double
    let stakedMRP: Double
    let unstakeWaitingMRP: Double
    let stakedMRB: Double
    let unstakeWaitingMRB: Double
}
