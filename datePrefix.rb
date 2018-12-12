#####################################################################
# Function: getFilename
#####################################################################
def getFilename(str)
    i = 0;

    tokensArray = str.split
    return tokensArray[tokensArray.size-1]
end


#####################################################################
# Function: getMonthDay
#####################################################################
def getMonthDay(str)
    i = 0;

    tokensArray = str.split
    
    monthRegexp = "jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec"

    while (i < tokensArray.size)
        if (tokensArray[i] =~ /#{monthRegexp}/i)
            result = Array.new
            # add month
            result.insert(0, tokensArray[i].downcase)
            # add month day
            result.insert(1, tokensArray[i+1])
            return result
        end
        i = i + 1
    end
end


#####################################################################
# Function: getYear
#####################################################################
def getYear(str)
    tokensArray = str.split
    return tokensArray[tokensArray.size-2]
end

#####################################################################
# Function: getDateYYYYMMDD
#####################################################################
def getDateYYYYMMDD(monthStr, monthDayStr, yearStr, monthLookup)
    mm = monthLookup[monthStr]

    if (mm < 10)
        mmStr = "0" + mm.to_s
    else
        mmStr = "" + mm.to_s
    end

    if (monthDayStr.to_i < 10)
        ddStr = "0" + monthDayStr
    else
        ddStr = "" + monthDayStr
    end

    return yearStr + mmStr + ddStr
end


#####################################################################
# Function: renameFile
#####################################################################
def renameFile(str, monthLookup)
    # find the filename
    filename = getFilename(str)
    if (filename == nil)
        return
    end

    # find month and day of month
    monthDayArray = getMonthDay(str)
    if (monthDayArray == nil)
        return
    end

    # find year
    year = getYear(str)
    if (year == nil)
        return
    end

    # convert the month and month day into YYYYMMDD
    dateYYYYMMDD = getDateYYYYMMDD(monthDayArray[0], monthDayArray[1], year, monthLookup)

    # construct new filename with YYYYMMDD_origFilename
    newFilename = dateYYYYMMDD + "_" + filename

    # replace file with new filename
    `mv #{filename} #{newFilename}`
end


#####################################################################
# Function:  entry/main
#####################################################################

# lookup table monthName => monthNum
monthLookup =  {
  'jan' => 1,
  'feb' => 2,
  'mar' => 3,
  'apr' => 4,
  'may' => 5,
  'jun' => 6,
  'jul' => 7,
  'aug' => 8,
  'sep' => 9,
  'oct' => 10,
  'nov' => 11,
  'dec' => 12,
}

cmdStdOut = ` ls -lT `
splitTokenStr = "\n"
cmdArray = cmdStdOut.split(splitTokenStr)

# for each entry in the array create obtain (1) filename and (2) date
cmdArray.each { |file| renameFile(file, monthLookup) }

