Dir.glob("./**").each {|dir|
    if File.directory?(dir)
        output = `cd #{dir} && crnormz -f "TO_IMPROVE" -f "expected.txt" --raw-output`
        File.write("#{dir}/expected.txt", output)
    end
}