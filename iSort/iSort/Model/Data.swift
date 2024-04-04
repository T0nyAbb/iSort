//
//  Data.swift
//  iSort
//
//  Created by Antonio Abbatiello on 03/04/24.
//

import Foundation

var algorithms: [Algorithm] = [

Algorithm(name: "BubbleSort", complexity: "O(n^2)", description: "Bubble Sort is a simple sorting algorithm that repeatedly steps through the list, compares adjacent elements, and swaps them if they are in the wrong order. The pass through the list is repeated until the list is sorted. "),

Algorithm(name: "QuickSort", complexity: "O(nlogn)", description: "Quick Sort is a divide-and-conquer algorithm that works by selecting a 'pivot' element from the array and partitioning the other elements into two sub-arrays according to whether they are less than or greater than the pivot. The sub-arrays are then recursively sorted."),

Algorithm(name: "InsertionSort", complexity: "O(n^2)", description: "Insertion Sort works by iteratively partitioning the input array into two sections: a sorted section and an unsorted section. It iterates through the unsorted section, taking one element at a time, and inserts it into its correct position within the sorted section by shifting larger elements to the right."),

Algorithm(name: "SelectionSort", complexity: "O(n^2)", description: "Selection Sort works by iteratively selecting the smallest (or largest) element from the unsorted part of the array and moving it to the beginning of the unsorted portion. This process effectively partitions the array into a sorted and an unsorted section. The algorithm repeats this process until the entire array is sorted, with each iteration adding one element to the sorted section."),

Algorithm(name: "HeapSort", complexity: "O(nlogn)", description: "Heap Sort works by first building a max-heap from the input array. This max-heap ensures that the maximum element is at the root. Then, it repeatedly extracts the maximum element from the heap, which is at the root, and swaps it with the last element of the heap. After each extraction, the heap is adjusted to maintain its properties. This process continues until all elements are sorted in ascending order. The result is a sorted array.")

]

