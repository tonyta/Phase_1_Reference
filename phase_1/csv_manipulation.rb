#preamble
require 'csv'

# With the following template, it's easy to turn csv rows into instances of a class.
class Test
	attr_reader :item_1, :item_2
	def initialize(args)
		@item_1 = args.fetch(:item_1)
		@item_2 = args.fetch(:item_2)
	end
end


def csv_to_objects(file) 
	tests = []
	CSV.foreach(file, 
				headers: true,
				header_converters: :symbol,
				# converters: :all
				) do |row|
	tests << Test.new(row)
	end
	tests
end

p csv_to_objects('csv_file.csv')[0].item_1
p csv_to_objects('csv_file.csv')[0].item_2


# General IO:
# See class ListIO in my Todo List model:

=begin
class List
  attr_accessor :tasks, :last_deleted, :recently_deleted, :deleted_tasks_file
  def initialize
    @tasks = []
    @recently_deleted = []
    @deleted_tasks_file = 'deleted_tasks.csv'
  end

  def add(new_task)
    tasks << new_task
  end

  def delete_by_id(id)
    delete(tasks[id])
  end

  def delete(task)
    @recently_deleted << @tasks.delete(task)
  end

  def load_from(file)
    @tasks = ListIO.new(file, self).load
  end

  def save_to(file)
    ListIO.new(file, self).save
  end

  def to_s
    tasks.join("\n")
  end

  def save_deleted
    ListIO.new(deleted_tasks_file, self).save_deleted
  end

  def restore_deleted
    @tasks += ListIO.new(deleted_tasks_file, self).load
  end

  def clear_deleted
    recently_deleted = []
    ListIO.new(deleted_tasks_file).clear
  end
end


class Task
  TASK_STATUS = { true => 'X', false => ' ', in_progress: '~' }
  attr_accessor :description, :complete
  def initialize(description, complete = false)
    @description = description
    @complete = complete
  end

  def to_s
    "#{description.ljust(60)}[#{mark_if_complete}] "
  end

  def mark_if_complete
    TASK_STATUS[complete]
  end

  def to_csv
    "#{description},#{complete}\n"
  end

  def mark_incomplete
    @complete = false
  end

  def mark_complete
    @complete = true
  end
end

class ListIO

  attr_accessor :file, :list

  def initialize(file, list = List.new)
    @file = file
    @list = list
  end

  def load #returns array of task objects
    # opts = { headers: true, header_converters: :symbol,converters: :all }
    CSV.read(file).map do |row|
      create_task(row)
    end
  end

  def save
    header = "description,complete\n"
    File.open(file, 'w') do |save_file|
      # save_file << header
      list.tasks.each do |task|
        save_file.write task.to_csv
      end
    end
  end

  def save_deleted
    header = "description,complete\n"
    File.open(file, 'a') do |save_file|
      # save_file << header
      list.recently_deleted.each do |task|
        save_file << task.to_csv
      end
    end
  end

  def clear
    File.delete(file)
  end


  def create_task(row)
    Task.new(row[0], row[1] == 'true')
  end
end



=end
















