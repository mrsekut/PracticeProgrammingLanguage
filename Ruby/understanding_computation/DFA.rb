# 有限オートマトン
class FARule < Struct.new(:state, :character, :next_state)
    # ある特定の状態で規則を適用可能かどうかを返す
    def applies_to?(state, character)
        self.state == state && self.character == character
    end

    # 機械をどの様に変更するかを返す
    def follow
        next_state
    end

    def inspect
        '#<FARule #{state.inspect} --#{character}}--> #{next_state.inspect}>'
    end
end

# 決定性有限オートマトンの規則集
class DFARulebook < Struct.new(:rules)
    # 次の状態がどうなるかを特定して返す
    def next_state(state, character)
        rule_for(state, character).follow
    end

    def rule_for(state, character)
        rules.detect { |rule| rule.applies_to?(state, character) }
    end
end


# 規則集を作成
rulebook = DFARulebook.new([
    FARule.new(1, 'a', 2), FARule.new(1, 'b', 1),
    FARule.new(2, 'a', 2), FARule.new(2, 'b', 3),
    FARule.new(3, 'a', 3), FARule.new(3, 'b', 3),
])

# 次の状態を見る
# 数値が状態を表す. ex. 1, 2, 3, ..
# 文字は機械に対する入力を表す. ex. 'a', 'b', ..
rulebook.next_state(1, 'a')
rulebook.next_state(1, 'b')