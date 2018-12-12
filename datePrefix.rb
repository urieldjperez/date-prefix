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
monthLookup = Hash.new
monthLookup['jan'] =  1
monthLookup['feb'] =  2
monthLookup['mar'] =  3
monthLookup['apr'] =  4
monthLookup['may'] =  5
monthLookup['jun'] =  6
monthLookup['jul'] =  7
monthLookup['aug'] =  8
monthLookup['sep'] =  9
monthLookup['oct'] = 10
monthLookup['nov'] = 11
monthLookup['dec'] = 12

cmdStdOut = ` ls -lT `
splitTokenStr = "\n"
cmdArray = cmdStdOut.split(splitTokenStr)

# for each entry in the array create obtain (1) filename and (2) date
cmdArray.each { |file| renameFile(file, monthLookup) }

