# 操作的意味論 SIMPLE
class Number < Struct.new(:value)
    def to_s
        value.to_s
    end

    def inspect
        "<<#{self}>>"
    end

    # 簡約可能かどうかを判定
    def reducible?
        false
    end
end

class Add < Struct.new(:left, :right)
    def to_s
        "#{left} + #{right}"
    end

    def inspect
        "<<#{self}>>"
    end

    # 簡約可能かどうかを判定
    def reducible?
        true
    end

    # 簡約
    def reduce(environment)
        if left.reducible?
            Add.new(left.reduce(environment), right)
        elsif right.reducible?
            Add.new(left, right.reduce(environment))
        else
            Number.new(left.value + right.value)
        end
    end
end

class Multiply < Struct.new(:left, :right)
    def to_s
        "#{left} * #{right}"
    end

    def inspect
        "<<#{self}>>"
    end

    # 簡約可能かどうかを判定
    def reducible?
        true
    end

    # 簡約
    def reduce(environment)
        if left.reducible?
            Add.new(left.reduce(environment), right)
        elsif right.reducible?
            Add.new(left, right.reduce(environment))
        else
            Number.new(left.value * right.value)
        end
    end
end

class Boolean < Struct.new(:value)
    def to_s
        value.to_s
    end

    def inspect
        "<<#{self}>>"
    end

    def reducible?
        false
    end
end

class LessThan < Struct.new(:left, :right)
    def to_s
        "#{left} < #{right}"
    end

    def inspect
        "<<#{self}>>"
    end

    def reducible?
        true
    end

    def reduc(environment)e
        if left.reducible?
            LessThan.new(left.reduce(environment), right)
        elsif right.reducible?
            LessThan.new(left, right.reduce(environment))
        else
            Boolean.new(left.value < right.value)
        end
    end
end

class Variable < Struct.new(:name)
    def to_s
        name.to_s
    end

    def inspect
        "<<#{self}>>"
    end

    def reducible?
        true
    end

    def reduce(environment)
        environment[name]
    end
end


# virtual machine
class Machine < Struct.new(:expression, :environment)
    def step
        self.expression = expression.reduce(environment)
    end

    # 現在の式を最終的に値になるまで簡約を繰り返す
    def run
        while expression.reducible?
            puts expression
            step
        end
        puts expression
    end
end

# ex.
############################################

# # 古いMachineクラスのことを忘れる
# Object.send(:remove_const, :Machine)

# Machine.new(
#     Add.new(
#         Multiply.new(Number.new(1), Number.new(2)),
#         Multiply.new(Number.new(3), Number.new(4))
#     )
# ).run

# # 不等号を試す
# Machine.new(
#     LessThan.new(Number.new(5), Add.new(Number.new(2), Number.new(2)))
# ).run

# 変数
Machine.new(
    Add.new(Variable.new(:x), Variable.new(:y)),
    { x: Number.new(3), y: Number.new(4) }
).run