require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1
    # skip
    # arrange
    robot = Robot.new
    robot.needs_repairs = true
    robot.foreign_model = true
    # act
    evaluate = robot.station
    expected = 1
    # assert
    assert_equal(expected,evaluate)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    # skip
    # arrange
    robot = Robot.new
    robot.needs_repairs = true
    robot.vintage_model = true
    # act
    evaluate = robot.station
    expected = 2
    # assert
    assert_equal(expected, evaluate)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    # skip
    # arrange
    robot = Robot.new
    robot.needs_repairs = true
    # act
    evaluate = robot.station
    expected = 3
    # assert
    assert_equal(expected,evaluate)
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    # skip
    # arrange
    robot = Robot.new

    # act
    evaluate = robot.station
    expected = 4
    # assert
    assert_equal(expected, evaluate, "you screwed up")
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    # skip
    # arrange
    robot = Robot.new



    # act
    evaluate= robot.prioritize_tasks
    expected = -1

    # assert
    assert_equal(expected,evaluate)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    # skip
    # arrange
    robot = Robot.new
    robot.todos = [1,2,3,4]
    # act
    evaluate = robot.prioritize_tasks
    expected = robot.todos.max
    # assert
    assert_equal(expected, evaluate)
  end

  def test_workday_on_day_off_returns_false
    # skip
    # arrange
    robot = Robot.new
    t = "today"
    robot.day_off = "today"
    # act
    evaluate = robot.workday?(t)
    expected = false
    # assert
    assert_equal(expected,evaluate)

  end

  def test_workday_not_day_off_returns_true
    # skip
    # arrange
    robot = Robot.new
    t = "today"
    robot.day_off = "yesterday"
    # act
    evaluate = robot.workday?(t)
    expected = true

    # assert
    assert_equal(expected, evaluate)
  end

end
