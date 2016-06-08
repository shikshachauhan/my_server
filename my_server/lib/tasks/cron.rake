require "#{Rails.root}/app/helpers/application_helper"
include ApplicationHelper
namespace :tasktable do
	server_ip()
	desc "Change each Pending status to completed"
	task :pen2com => :environment do
		Task.find_each do |task|
			if task.Status == "Pending"
				puts task.TaskId	
				task.update(Status: "Completed")
			end   
		end   
		puts "Status changed at time : " + Time.new.inspect
	end

	desc "Change each Completed status to Pending"
	task :com2pen => :environment do
		Task.find_each do |task|
			if task.Status == "Completed"
				puts task.TaskId	
				task.update(Status: "Pending")
			end   
		end   
		puts "Status changed at time : " + Time.new.inspect
	end

	desc "Fill block"
	task :block => :environment do
		Message.find_each do |task|
			task.update(Group_id: "172") 
		end   
		puts "Block filled at time : " + Time.new.inspect
	end

	desc "Completes all Pending message tasks"
	task :message_task => :environment do
		Task.find_each do |task|
			if task.TaskName == "LaunchMessage" and task.Type == "Message" and task.Status == "Pending"
				msg = Message.where(TextId: task.ItemId).first
				puts "Task "+task.TaskId.to_s
				gcmid = Admin.find_by(id: task.MemberId).gcmid
				puts " Message "+task.ItemId.to_s
				#message = {"gcmid": gcmid, "message_id": msg.Template_id, "caller_ids": task.Contacts, "group_ids": task.Groups, "message_args": msg.Message_params.to_s}.to_s		
				response = RestClient.post("http://#{@ip}:3000/message", gcmid: gcmid, message_id: msg.Template_id, caller_ids: task.Contacts, group_ids: task.Groups, message_args: msg.Message_params.to_s)
				puts response

				Task.destroy(task.TaskId)   #delete the current task.
				puts "deleted task"
			end   
		end   
		puts "Status changed at time : " + Time.new.inspect
	end

	desc "Completes all Pending recording tasks"
	task :recording_task => :environment do
		Task.find_each do |task|
			if task.TaskName == "LaunchRecording" and task.Type == "Recording" and task.Status == "Pending"
				rec = Recording.where(RecId: task.ItemId).first
				puts "Task "+task.TaskId.to_s
				gcmid = Admin.find_by(id: task.MemberId).gcmid
				puts gcmid
				puts " Recording "+task.ItemId.to_s
				response = RestClient.post("http://#{@ip}:3000/recording", gcmid: gcmid, caller_ids: task.Contacts , group_ids: task.Groups, uploadedfile: File.new("Recordings/#{rec.RecFileName}"))
				puts response

				Task.destroy(task.TaskId)   #delete the current task.
				puts "deleted task"
			end   
		end   
		puts "Status changed at time : " + Time.new.inspect
	end

	desc "Completes all Pending Create Contact tasks"
	task :contact_task => :environment do
		Task.find_each do |task|
			if task.TaskName == "CreateContact" and task.Type == "Contact" and task.Status == "Pending"
				con = Contact.where(id: task.ItemId).first
				puts "Task "+task.TaskId.to_s
				gcmid = Admin.find_by(id: task.MemberId).gcmid
				puts gcmid
				puts " Contact "+task.ItemId.to_s
				response = RestClient.post("http://#{@ip}:3000/contact", gcmid: gcmid, name: con.Name, number: con.Number, gender: con.Gender, clist_ids: con.Clist_ids, resource_uri: con.Resource_uri, age: con.Age, district: con.District, block: con.Block, state: con.State, location: con.Location)
				puts response

				Task.destroy(task.TaskId)   #delete the current task.
				puts "deleted task"
			end   
		end   
		puts "Status changed at time : " + Time.new.inspect
	end

	desc "Completes all Pending Create ContactList tasks"
	task :contactlist_task => :environment do
		Task.find_each do |task|
			if task.TaskName == "CreateContactList" and task.Type == "ContactList" and task.Status == "Pending"
				con = Group.where(id: task.ItemId).first
				puts "Task "+task.TaskId.to_s
				gcmid = Admin.find_by(id: task.MemberId).gcmid
				puts gcmid
				puts " ContactList "+task.ItemId.to_s
				response = RestClient.post("http://#{@ip}:3000/contactlist", gcmid: gcmid, name: con.Name)
				puts response

				Task.destroy(task.TaskId)   #delete the current task.
				puts "deleted task"
			end   
		end   
		puts "Status changed at time : " + Time.new.inspect
	end

	desc "Completes all Pending survey tasks"
	task :survey_task => :environment do
		Task.find_each do |task|
			if task.Status == "Completed"
				puts task.TaskId	
				task.update(Status: "Pending")
			end   
		end   
		puts "Status changed at time : " + Time.new.inspect
	end

	desc "Change each Completed status to Pending"
	task :cronjob => [:message_task, :recording_task, :survey_task] do
		puts "All pending tasks completed at : " + Time.new.inspect
	end
end