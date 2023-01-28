public struct UserData: Codable {
    let user: User
    let status: String
}

public struct User: Codable {
    let id: String
    let wallet_name: String
    let withdraw_fee_mrp: Double
    let withdraw_fee_mrb: Double
    let karma_params: KarmaParams
    let stake_params: StakeParams
    let stake_level: Int
    let api_key: String
    let game_balance: String
    let claim_amount: Double
    let balance_mrp: Double
    let balance_mrb: Double
    let last_withdraw: String
    let last_withdraw_mrb: String
    let is_banned: Bool
    let created: String
    let updated: String
}

struct KarmaParams: Codable {
    let total_purchases: Double
    let total_purchases_mrb: Double
    let total_withdrawn: Double
    let total_deposit: Double
    let karma_modifier: Double
    let karma_percent: Int
    let karma_percent_category: Int
    let initial_withdraw_fee: Int
}

struct StakeParams: Codable {
    let stake_level: Int
    let total_staked: Double
    let staked_mrp: Double
    let unstake_waiting_mrp: Double
    let staked_mrb: Double
    let unstake_waiting_mrb: Double
}
