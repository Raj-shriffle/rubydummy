require "./Login.rb"
require 'io/console'
require_relative "Singup"
require "securerandom"
require "./Authlogin.rb"
$a=1
$b=[]
$z=1

class A
	include Login
	def initialize
		begin
		  print "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"                
		  puts "*******************************************************Welcome to the FaceBook***********************************"
		  puts "\n\n\n\n\n\n"
		  puts "\t\t\t\t\t\t\t1.Log_in"
		  puts "\t\t\t\t\t\t\t2.New user please Singup"
		  puts "\t\t\t\t\t\t\t3.For the exit"
		  ask=gets.chomp
		  case ask 
		  	when "1" 
		  	  Login.log
		  	when "2"
		  	  sing
		  	when "admin"
		   	  Auth.ask
		  	when "3"
		  	  exit
		  	else
		  	 	p 'invaild option'
		  	 	sleep(2)
		  	 	raise 
		  	end
		rescue
			print "\t\t\t\t\t\t\tinvaild option Enter Again!!"
			retry
		end
  end

    def sing
            begin
               	temp=[]
               	$a=SecureRandom.random_number(100)
                fh=File.new("Homeid.txt","r")
                v=fh.read
                fh.close
            if (j=v.include?($a.to_s))
                	puts "dublicate randome genrate #$a"
                	raise
            end
                     rescue
                     retry
            end
               if(j==false)
               	   temp.push($a)
               	   fh=File.new('Homeid.txt','a')
               	   fh.write(temp)
               	   fh.close
                   fh.close
                   @id=$a
                   info
               end
    end
    def info
    	       print "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"                
               puts "********************************************Welcome To The Sinup page Please Fill your data here**********************"
               puts 'Enter Your name or for Back press 0'
               name_check
	end
	def name_check
		 n=gets.chomp
		       if n=="0"
				    initialize
		       else
			     	nv=/^[a-zA-Z]{3,15}$/
		            if nv.match?(n)
		            	email_check(n)
		            else
		            	p 'Enter Again Name'
			            sleep(1)
			        raise
		            end
		       end
	rescue
		retry
    end
    def email_check(name)
		   p 'Enter Your Mail'
		   m=gets.chomp
		   mv=/^(?:[a-zA-Z0-9]+[@]{1}+[g]{1}+[m]{1}+[a]{1}+[i]{1}+[l]{1}+[.]{1}+[c]{1}+[o]{1}+[m]{1})$/
		   if mv.match?(m)
			 pass_check(name,m)
		   else
		   	  p 'incorrect mail'
			  sleep(0.5)
			  raise
		   end
	rescue
		retry
    end
    def pass_check(name,email)
		puts 'Enter your password (Password length should be 10 digit)'
		pa = STDIN.noecho(&:gets).chomp
		pv=/^(?:[a-zA-Z]{1,5}+[0-9]{1,5})$/
		if pv.match?(pa)
			mob_check(name,email,pa)
		else
			p 'A minimum 10 characters password contains a combination of uppercase or lowercase with digit'
		    sleep(1)
			raise
        end
	rescue
		retry
end
	def mob_check(name,email,pass)
		puts 'Enter your Gender'
		g=gets.chomp
		if g=='f' || g=='m' || g=='male' || g='Male' || g=='female' || g=='Female'
			validation(name,email,pass,g)
		else
			raise
		end
	rescue
		p 'invaild'
		sleep(1)
		retry
	end
	def validation(n,m,pa,g)
		                 k12=File.new('Singupdata.txt','r')
		    	         j2=k12.read 
		    	         k12.close
		    	         if j2.size==0
		                      a=[]
		                      h={}
		                      id=@id
		                     h.store("id",id)
		                     h.store("name",n)
		                     h.store("mail",m)
		                     h.store("pas",pa)
		                     h.store("G",g)
		                     f3=File.new("Singupdata.txt",'w')
		                     a.push(h)
		                     f3.write(a)
		                     f3.close
		                     p 'wait for the conformation'
		                     sleep(1)
		                     p 'data inserted'
		                     sleep(1)
		                     Login.log
		                 else
		                     j2=eval(j2)
		                      h={}
		                      id=@id
		                      h.store("id",id)
		                     h.store("name",n)
		                     h.store("mail",m)
		                     h.store("pas",pa)
		                     h.store("G",g)
		                     j2.push(h)
		                     f3=File.new("Singupdata.txt",'w')
		                     f3.write(j2)
		                     f3.close
		                     p 'wait for the conformation'
		                     sleep(1)
		                     p 'data inserted'
		                     sleep(1)
		                     Login.log
		                    
		                end
		            rescue
		            	retry       
     end	
end
a=A.new
