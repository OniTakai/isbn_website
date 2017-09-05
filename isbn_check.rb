def check_last_number(isbn_clean)
    my_sum = 0
    my_13_sum = 0
    isbn_clean = isbn_clean.gsub(/\D/, '')
    isbn_clean = isbn_clean
    if isbn_clean.length == 10
    isbn_clean = isbn_clean[0..9]    
    my_isbn_array = isbn_clean.split('')
    last_digit = my_isbn_array.pop
    my_isbn_array.each.with_index do |item,index|
        my_sum = my_sum + (item.to_i * (index.to_i + 1))
    end 
        check_digit = my_sum % 11
        if check_digit.to_s == last_digit.to_s
            my_isbn_array << check_digit.to_s
            puts "#{my_isbn_array} is a valid ISBN 10 number"
            true
        elsif 
        check_digit == 10
            my_isbn_array << "X"
        else 
            puts "This is not a valid ISBN"
            false
        end 

    elsif isbn_clean.length == 13
        isbn_clean = isbn_clean[0..12]    
        my_isbn_array = isbn_clean.split('')
        last_digit_13 = my_isbn_array.pop
        my_isbn_array.each.with_index do |value,index|
            if (index + 1) % 2 == 0
                my_13_sum = my_13_sum + (value.to_i * 3)
            else
                my_13_sum = my_13_sum + value.to_i 
            end  
        end 
        check_digit_13 = my_13_sum % 10 
        check_digit_13_final = (10 - check_digit_13) % 10  
        if check_digit_13_final.to_s == last_digit_13.to_s
            my_isbn_array << check_digit_13_final
            puts "#{my_isbn_array} is a valid ISBN 13 number"
            true
        elsif check_digit_13_final == 10 
            my_isbn_array << "X"
        else 
            puts "This is not a valid ISBN number"
            false
        end
    else     
    puts "This is not a valid ISBN number"
    end 
end 


