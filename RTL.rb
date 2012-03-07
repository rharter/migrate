# Ryan's Template Language
#
# This module will parse a document
module RTL
  
  # Loads and parses a template from a file.  Note, this doesn't
  # work exactly the same as the RTL::load(string) method since
  # a file may be too large to load into memory all at once.
  def RTL.load_file(file)
    if !File.exists? file
      raise ArgumentError, "File doesn't exist", caller
    end
    
    if !File.readable? file
      raise ArgumentError, "File isn't readable", caller
    end
    
    ret = Hash.new
    f = File.new file, 'r'
    
    cur = ''
    while line = f.gets
      # If we are in a template and the current line
      # starts with a '\t', add the line to the template,
      # otherwise end the template
      if !cur.empty?
        if line[0].eql? '\t'
          line = line[1..-1]
          ret[cur] += line
        else
          cur = ''
        end
      end
      
      # Empty lines are ignored
      if line.empty?
        next
      end
      
      # Hashes are ignored
      if line[0].eql? '#'
        next
      end
      
      if line[line.length - 2].eql? ':'
        cur = line[0..-2]
      end
    end
  end
  
  def RTL.load(string)
    ret = Hash.new
    
    cur = ''
    string.each_line do |line|
      # If we are in a template and the current line
      # starts with a '\t', add the line to the template,
      # otherwise end the template
      if !cur.empty?
        if line[0].eql? '\t'
          line = line[1..-1]
          ret[cur] += line
        else
          cur = ''
        end
      end
      
      # Empty lines are ignored
      if line.empty?
        next
      end
      
      # Hashes are ignored
      if line[0].eql? '#'
        next
      end
      
      if line[line.length - 2].eql? ':'
        cur = line[0..-2]
      end
    end
  end
end