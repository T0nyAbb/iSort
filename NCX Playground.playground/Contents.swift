import Foundation

extension Array where Element: Comparable {
    @inlinable
    mutating func bubbleSort() {
        guard count > 1 else { return }
        
        for i in 0..<count {
            for j in 1..<count - i {
                if self[j] < self[j - 1] {
                    swapAt(j, j - 1)
                }
            }
        }
    }
}

extension Array where Element: Comparable {
    @inlinable
    mutating func optimizedBubbleSort() {
        guard count > 1 else { return }
        
        var swapped = false
        repeat {
            swapped = false
            for i in 1..<count {
                if self[i] < self[i - 1] {
                    swapAt(i, i - 1)
                    swapped = true
                }
            }
        } while swapped
    }
}

extension Array where Element: Comparable {
    @inlinable
    mutating func quickSort() {
        quickSortHelper(start: 0, end: count - 1)
    }
    @inlinable
    internal mutating func quickSortHelper(start: Int, end: Int) {
        if start < end {
            let pivotIndex = partition(start: start, end: end)
            quickSortHelper(start: start, end: pivotIndex - 1)
            quickSortHelper(start: pivotIndex + 1, end: end)
        }
    }
    @inlinable
    internal mutating func partition(start: Int, end: Int) -> Int {
        let pivot = self[end]
        var i = start
        
        for j in start..<end {
            if self[j] <= pivot {
                swapAt(i, j)
                i += 1
            }
        }
        swapAt(i, end)
        return i
    }
}

extension Array where Element: Comparable {
    @inlinable
    mutating func optimizedQuickSort() {
        quickSortHelper(low: 0, high: count - 1)
    }
    @inlinable
    internal mutating func quickSortHelper(low: Int, high: Int) {
        if low < high {
            let pivotIndex = partition(low: low, high: high)
            quickSortHelper(low: low, high: pivotIndex - 1)
            quickSortHelper(low: pivotIndex + 1, high: high)
        }
    }
    
    @inlinable
    internal mutating func partition(low: Int, high: Int) -> Int {
        let pivotIndex = Int.random(in: low...high)
        swapAt(pivotIndex, high)
        var i = low
        
        for j in low..<high {
            if self[j] <= self[high] {
                swapAt(i, j)
                i += 1
            }
        }
        
        swapAt(i, high)
        return i
    }
}





func defaultSort() {
    
    let start = CFAbsoluteTimeGetCurrent()
    // run your work
    print("\n----------DEFAULT SORT------------\n")
    
    let size = 1_000_000
    print("Generating array with \(size) elements...")
    
    var myArray = (0..<size).map { _ in
        Int.random(in: 0..<1_000_000) // Generates a random integer between 0 and 1.000.000
    }
    
    let diff = CFAbsoluteTimeGetCurrent() - start
    print("Done\nTook \(diff.formatted(.number)) seconds")
    
    
    print("Sorting array with default sort...")

    let startSorting = CFAbsoluteTimeGetCurrent()
    
    
    myArray.sort()
    
    let difference = CFAbsoluteTimeGetCurrent() - startSorting
    print("Array sorted in \(difference.formatted(.number)) seconds")
    print("\n-----------------------------------\n")
    
}

func bubbleSort() {
    
    let start = CFAbsoluteTimeGetCurrent()
    // run your work
    print("\n----------BUBBLE SORT------------\n")
    let size = 300
    print("Generating array with \(size) elements...")
    var myArray = (0..<size).map { _ in
        Int.random(in: 0..<1_000_000) // Generates a random integer between 0 and 1.000.000
    }
    
    let diff = CFAbsoluteTimeGetCurrent() - start
    print("Done\nTook \(diff.formatted(.number)) seconds")
    
    
    print("Sorting array with bubble sort...")
    let startSorting = CFAbsoluteTimeGetCurrent()
    
    
    
    myArray.bubbleSort()
    
    let difference = CFAbsoluteTimeGetCurrent() - startSorting
    print("Array sorted in \(difference.formatted(.number)) seconds")
    print("\n-----------------------------------\n")
    
}

func optimizedBubbleSort() {
    
    let start = CFAbsoluteTimeGetCurrent()
    // run your work
    
    print("\n----------OPTIMIZED BUBBLE SORT------------\n")
    let size = 300
    print("Generating array with \(size) elements...")
    var myArray = (0..<size).map { _ in
        Int.random(in: 0..<1_000_000) // Generates a random integer between 0 and 1.000.000
    }
    
    let diff = CFAbsoluteTimeGetCurrent() - start
    print("Done\nTook \(diff.formatted(.number)) seconds")
    
    print("Sorting array with optimized bubble sort...")
    let startSorting = CFAbsoluteTimeGetCurrent()
    
    
    
    myArray.optimizedBubbleSort()
    
    let difference = CFAbsoluteTimeGetCurrent() - startSorting
    print("Array sorted in \(difference.formatted(.number)) seconds")
    print("\n-----------------------------------\n")
    
}

func quickSort() {
    
    let start = CFAbsoluteTimeGetCurrent()
    // run your work
    
    print("\n----------QUICK SORT------------\n")
    let size = 1000
    print("Generating array with \(size) elements...")
    var myArray = (0..<size).map { _ in
        Int.random(in: 0..<1_000_000) // Generates a random integer between 0 and 1.000.000
    }
    
    let diff = CFAbsoluteTimeGetCurrent() - start
    print("Done\nTook \(diff.formatted(.number)) seconds")
    
    print("Sorting array with quick sort...")
    let startSorting = CFAbsoluteTimeGetCurrent()
    
    
    
    myArray.quickSort()
    
    let difference = CFAbsoluteTimeGetCurrent() - startSorting
    print("Array sorted in \(difference.formatted(.number)) seconds")
    print("\n-----------------------------------\n")
    
}

func optimizedQuickSort() {
    
    let start = CFAbsoluteTimeGetCurrent()
    // run your work
    
    print("\n----------OPTIMIZED QUICK SORT------------\n")
    
    let size = 1000
    print("Generating array with \(size) elements...")
    var myArray = (0..<size).map { _ in
        Int.random(in: 0..<1_000_000) // Generates a random integer between 0 and 1.000.000
    }
    
    let diff = CFAbsoluteTimeGetCurrent() - start
    print("Done\nTook \(diff.formatted(.number)) seconds")
    
    print("Sorting array with optimized quick sort...")
    let startSorting = CFAbsoluteTimeGetCurrent()
    
    
    
    myArray.quickSort()
    
    let difference = CFAbsoluteTimeGetCurrent() - startSorting
    print("Array sorted in \(difference.formatted(.number)) seconds")
    
    print("\n-----------------------------------\n")
    
}

defaultSort()
bubbleSort()
optimizedBubbleSort()
quickSort()
optimizedQuickSort()






