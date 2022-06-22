Dir.glob("./**").each {|dir|
    if File.directory?(dir)
        output = `cd #{dir} && crnormz -f "expected.txt|TO_IMPROVE" --raw-output -s`
        File.write("#{dir}/expected.txt", output)
    end
}