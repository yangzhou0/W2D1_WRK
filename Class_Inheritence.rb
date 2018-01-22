class Employee
  attr_reader :salary, :name

  def initialize (name, title, salary,boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    @boss.employees << self unless @boss.nil?
  end

  def bonus(multiplier)
    self.salary * multiplier
  end

end

class Manager < Employee
  attr_reader :employees

  def initialize(name, title, salary,boss = nil)
    super
    @employees = []
  end

  def bonus(multiplier)
    self.salary_of_all_subemployees * multiplier
  end

  def salary_of_all_subemployees
    self.employees.reduce(0) do |acc, emp|
      if emp.is_a? Manager
        acc += emp.salary_of_all_subemployees + emp.salary
      else
        acc += emp.salary
      end
    end
  end


end
