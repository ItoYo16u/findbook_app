class Review < ApplicationRecord
   belongs_to :book
   belongs_to :user

   def self.summary(book_id)
      review_summary =[]
      col_names = [:recommend,:price,:understandable,:trustable,:interesting]
      col_names.each do |c|
      review_summary << self.where(book_id:book_id).average(c)
      end
      review_summary.map!{|v| v ? v : 0}
   end

   def self.summary_v2(book_id)
      review_summary ={recommend: 0,price: 0,understandable: 0,trustable: 0,interesting: 0}
      review_summary.map do |key,val|
      review_summary[key] = self.where(book_id:book_id).average(key)
      end
      review_summary
   end
   def self.count_by_group
      counts_by_group_hashes ={
         recommend:{},
         price:{},
         understandable:{},
         trustable:{},
         interesting:{}
      }
      counts_by_group_hashes.each do |k,i|
        counts_by_group_hash={5=>0,4=>0,3=>0,2=>0,1=>0}
        counts_by_group_hash.update(self.group(k).count())
        counts_by_group_hashes[k].update(counts_by_group_hash)
      end
   end
end
