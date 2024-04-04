//
//  ArrayAlgorithms+Ext.swift
//  iSort
//
//  Created by Antonio Abbatiello on 03/04/24.
//

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

extension Array where Element: Comparable {
    @inlinable
    mutating func insertionSort() {
        guard count > 1 else { return }

        for index in 1..<count {
            let currentValue = self[index]
            var position = index

            // Shift elements to the right to make space for the current value
            while position > 0 && self[position - 1] > currentValue {
                self[position] = self[position - 1]
                position -= 1
            }

            // Place the current value in its correct position
            self[position] = currentValue
        }
    }
}


extension Array where Element: Comparable {
    @inlinable
    mutating func heapSort() {
        // Build max heap
        buildMaxHeap()

        // Extract elements from heap in sorted order
        var end = count - 1
        while end > 0 {
            swapAt(0, end)
            heapify(from: 0, to: end)
            end -= 1
        }
    }
    @inlinable
    internal mutating func buildMaxHeap() {
        var start = (count - 2) / 2 // Parent of the last node
        while start >= 0 {
            heapify(from: start, to: count)
            start -= 1
        }
    }
    @inlinable
    internal mutating func heapify(from index: Int, to endIndex: Int) {
        var root = index
        while root * 2 + 1 < endIndex {
            var child = root * 2 + 1
            if child + 1 < endIndex && self[child] < self[child + 1] {
                child += 1
            }
            if self[root] < self[child] {
                swapAt(root, child)
                root = child
            } else {
                return
            }
        }
    }
}

extension Array where Element: Comparable {
    @inlinable
    mutating func selectionSort() {
        guard count > 1 else { return }

        for currentIndex in 0..<count - 1 {
            var minIndex = currentIndex

            // Find the index of the smallest element in the remaining unsorted portion
            for index in currentIndex + 1..<count {
                if self[index] < self[minIndex] {
                    minIndex = index
                }
            }

            // Swap the current element with the smallest element found
            if minIndex != currentIndex {
                swapAt(currentIndex, minIndex)
            }
        }
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

func bubbleSort(size: Int) async -> String {
    
    let start = CFAbsoluteTimeGetCurrent()
    // run your work
    print("\n----------BUBBLE SORT------------\n")
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
    let result = "sorted \(size.formatted()) elements in  \(difference.formatted(.number.precision(.integerAndFractionLength(integer: 2, fraction: 2)))) seconds"
    print(result)
    print("\n-----------------------------------\n")
    return result
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

func quickSort(size: Int) async -> String {
    
    let start = CFAbsoluteTimeGetCurrent()
    // run your work
    
    print("\n----------QUICK SORT------------\n")
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
    let result = "sorted \(size.formatted()) elements in  \(difference.formatted(.number.precision(.integerAndFractionLength(integer: 2, fraction: 2)))) seconds"
    print(result)
    print("\n-----------------------------------\n")
    return result
}

func insertionSort(size: Int) async -> String {
    
    let start = CFAbsoluteTimeGetCurrent()
    // run your work
    
    print("\n----------INSERTION SORT------------\n")
    
    print("Generating array with \(size) elements...")
    var myArray = (0..<size).map { _ in
        Int.random(in: 0..<1_000_000) // Generates a random integer between 0 and 1.000.000
    }
    
    let diff = CFAbsoluteTimeGetCurrent() - start
    print("Done\nTook \(diff.formatted(.number)) seconds")
    
    print("Sorting array with optimized quick sort...")
    let startSorting = CFAbsoluteTimeGetCurrent()
    
    
    
    myArray.insertionSort()
    
    let difference = CFAbsoluteTimeGetCurrent() - startSorting
    let result = "sorted \(size.formatted()) elements in  \(difference.formatted(.number.precision(.integerAndFractionLength(integer: 2, fraction: 2)))) seconds"
    print(result)
    print("\n-----------------------------------\n")
    return result
    
}

func heapSort(size: Int) async -> String {
    
    let start = CFAbsoluteTimeGetCurrent()
    // run your work
    
    print("\n----------HEAP SORT------------\n")
    
    print("Generating array with \(size) elements...")
    var myArray = (0..<size).map { _ in
        Int.random(in: 0..<1_000_000) // Generates a random integer between 0 and 1.000.000
    }
    
    let diff = CFAbsoluteTimeGetCurrent() - start
    print("Done\nTook \(diff.formatted(.number)) seconds")
    
    print("Sorting array with optimized quick sort...")
    let startSorting = CFAbsoluteTimeGetCurrent()
    
    
    
    myArray.heapSort()
    
    let difference = CFAbsoluteTimeGetCurrent() - startSorting
    let result = "sorted \(size.formatted()) elements in  \(difference.formatted(.number.precision(.integerAndFractionLength(integer: 2, fraction: 2)))) seconds"
    print(result)
    print("\n-----------------------------------\n")
    return result
    
}

func selectionSort(size: Int) async -> String {
    
    let start = CFAbsoluteTimeGetCurrent()
    // run your work
    
    print("\n----------HEAP SORT------------\n")
    
    print("Generating array with \(size) elements...")
    var myArray = (0..<size).map { _ in
        Int.random(in: 0..<1_000_000) // Generates a random integer between 0 and 1.000.000
    }
    
    let diff = CFAbsoluteTimeGetCurrent() - start
    print("Done\nTook \(diff.formatted(.number)) seconds")
    
    print("Sorting array with optimized quick sort...")
    let startSorting = CFAbsoluteTimeGetCurrent()
    
    
    
    myArray.selectionSort()
    
    let difference = CFAbsoluteTimeGetCurrent() - startSorting
    let result = "sorted \(size.formatted()) elements in  \(difference.formatted(.number.precision(.integerAndFractionLength(integer: 2, fraction: 2)))) seconds"
    print(result)
    print("\n-----------------------------------\n")
    return result
    
}

func selectAlgorithm(_ algo: String, size: Int) async -> String {
    switch algo {
    case "BubbleSort":
        return await bubbleSort(size: size)
    case "QuickSort":
        return await quickSort(size: size)
    case "InsertionSort":
        return await insertionSort(size: size)
    case "HeapSort":
        return await heapSort(size: size)
    case "SelectionSort":
        return await selectionSort(size: size)
    default:
        return "Invalid selection"
    }
}

//defaultSort()
//bubbleSort()
//optimizedBubbleSort()
//quickSort()
//optimizedQuickSort()







