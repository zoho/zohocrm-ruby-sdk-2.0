require 'ZOHOCRMSDK2_0'

class File
  def self.upload_file
    # """
    # This method is used to upload a file and print the response.
    # :param absolute_file_path: The absolute file path of the file to be attached
    # """

    # """
    # example
    # absolute_file_path = "/Users/user_name/Desktop/download.png";
    # """

    # Get instance of FileOperations Class
    fo = ZOHOCRMSDK::Files::FileOperations.new
    # Get instance of FileBodyWrapper Class that will contain the request body
    bw = ZOHOCRMSDK::Files::BodyWrapper.new
    # """
    # StreamWrapper can be initialized in any of the following ways

    # * param 1 -> fileName
    # * param 2 -> Read Stream.
    # * param 3 -> Absolute File Path of the file to be attached
    # """
    # stream_wrapper = StreamWrapper.new(name,stream,absolutefilepath)
    # Get instance of ParameterMap Class
    pm = ZOHOCRMSDK::ParameterMap.new
    pm.add(ZOHOCRMSDK::Files::FileOperations::UploadFilesParam.type, 'inline')
    sw1 = ZOHOCRMSDK::Util::StreamWrapper.new(nil, nil, '/Users/username/Documents/file.png')
    sw2 = ZOHOCRMSDK::Util::StreamWrapper.new(nil, nil, '/Users/username/Documents/file1.png')
   # Set list of files to the BodyWrapper instance
    files = [sw1, sw2]
    bw.file = files
    # Call upload_file method that takes BodyWrapper instance as parameter.
    response = fo.upload_files(bw, pm)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::Files::ActionWrapper
          action_responses = action_handler.data
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? ZOHOCRMSDK::Files::SuccessResponse
              success_response = action_response
              # Get the Code
              print 'code:'
              print success_response.code.value
              # Get the Status
              print "\n status:"
              print success_response.status.value
              # Get the Message
              print "\n message:"
              print success_response.message.value
              # Get the details map
              success_response.details.each do |k, v|
                print "\n"
                print k
                print v
                print "\n"
              end
            # Check if the request returned an exception
            elsif action_response.is_a? ZOHOCRMSDK::Files::APIException
              api_exception = action_response
              # Get the Code
              print 'code:'
              print api_exception.code.value
              # Get the Status
              print "\n status:"
              print api_exception.status.value
              # Get the Message
              print "\n message:"
              print api_exception.message.value
              # Get the details map
              api_exception.details.each do |k, v|
                print "\n"
                print k
                print v
                print "\n"
              end
              print "\n"
            end
          end
        # Check if the request returned an exception
        elsif action_handler.is_a? ZOHOCRMSDK::Files::APIException
          api_exception = action_handler
          # Get the Code
          print 'code:'
          print api_exception.code.value
          # Get the Status
          print "\n status:"
          print api_exception.status.value
          # Get the Message
          print "\n message:"
          print api_exception.message.value
          # Get the details map
          api_exception.details.each do |k, v|
            print "\n"
            print k
            print v
            print "\n"
          end
          print "\n"
        end
      else
        response_object = response.data_object
        response_object.instance_variables.each do |field|
          print field
          print "\n"
          print response_object.instance_variable_get(field)
        end
      end
    end
  end

  def self.get_file(id, destination_folder)
    # """
    # This method is used to download the file with ID and write in the destinationFolder
    # :param id: The ID of the uploaded File.
    # :param destination_folder: The absolute path of the destination folder to store the File
    # """

    # """
    # example
    # id = "ae9c7cefa418aec1d6a5cc2d9ab35c3231aae3bfeef7d5e00a54b7563c0dd42b";
    # destination_folder = "/Users/user_name/Desktop"
    # """
    # Get instance of FileOperations Class
    fo = ZOHOCRMSDK::Files::FileOperations.new
    # Get instance of ParameterMap Class
    pm = ZOHOCRMSDK::ParameterMap.new
    # Add the id to ParameterMap instance
    pm.add(ZOHOCRMSDK::Files::FileOperations::GetFileParam.id, id)
    # Call get_file method that takes ParameterMap instance as parameter
    response = fo.get_file(pm)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      if [204, 304].include? status_code
        print(status_code == 204 ? 'No Content' : 'Not Modified')
        return
      end
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        response_handler = response.data_object
        # Check if expected FileBodyWrapper instance is received.
        if response_handler.is_a? ZOHOCRMSDK::Files::FileBodyWrapper
          # Get StreamWrapper instance from the returned FileBodyWrapper instance
          file_body_wrapper = response_handler
          stream_wrapper = file_body_wrapper.file
          # Construct the file name by joining the destinationFolder and the name from StreamWrapper instance
          # Open the destination file where the file needs to be written in 'w' mode
          File.open(destination_folder + '/' + stream_wrapper.name, 'w') do |f|
            f.write(stream_wrapper.stream)
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? ZOHOCRMSDK::Files::APIException
          exception = response_handler
          # Get the Code
          print 'code:'
          print exception.code.value
          # Get the Status
          print "\n status:"
          print exception.status.value
          # Get the Message
          print "\n message:"
          print exception.message.value
          # Get the details map
          exception.details.each do |k, v|
            print "\n"
            print k
            print v
            print "\n"
          end
          print "\n"
        end
      elsif status_code != 204
        response_object = response.data_object
        response_object.instance_variables.each do |field|
          print field
          print "\n"
          print response_object.instance_variable_get(field)
        end
      end
    end
  end
end
