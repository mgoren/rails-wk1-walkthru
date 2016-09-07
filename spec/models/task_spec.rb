require 'rails_helper'

describe Task do
  it { should validate_presence_of :description }
  it { should belong_to :list }

  describe(".done") do
    it("returns tasks marked as done") do
      list = List.create({:name => "stuff"})
      unfinished_task = list.tasks.create({:description => "unfinished task", :done => false})
      done_task1 = list.tasks.create({:description => "woke up", :done => true})
      done_task2 = list.tasks.create({:description => "drank coffee", :done => true})
      done_tasks = [done_task1, done_task2]
      expect(Task.done()).to(eq(done_tasks))
    end
  end

  describe(".not_done") do
    it("returns not done tasks") do
      list = List.create({:name => "stuff"})
      unfinished_task = list.tasks.create({:description => "unfinished task", :done => false})
      done_task1 = list.tasks.create({:description => "woke up", :done => true})
      done_task2 = list.tasks.create({:description => "drank coffee", :done => true})
      not_done_tasks = [unfinished_task]
      expect(Task.not_done()).to(eq(not_done_tasks))
    end
  end


end
