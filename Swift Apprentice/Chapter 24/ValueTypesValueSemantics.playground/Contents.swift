import UIKit

private class Pixels {
    let storageBuffer: UnsafeMutableBufferPointer<UInt8>
    init(size: Int, value: UInt8) {
        let p = UnsafeMutablePointer<UInt8>.allocate(capacity: size)
        storageBuffer = UnsafeMutableBufferPointer<UInt8>(start: p, count: size)
        storageBuffer.initialize(from: repeatElement(value, count: size)) }
    init(pixels: Pixels) {
        let otherStorage = pixels.storageBuffer
        let p = UnsafeMutablePointer<UInt8>.allocate(capacity: otherStorage.count)
        storageBuffer = UnsafeMutableBufferPointer<UInt8>(start: p, count: otherStorage.count)
        storageBuffer.initialize(from: otherStorage) }
    subscript(offset: Int) -> UInt8 { get {
        return storageBuffer[offset]
        }
        set {
            storageBuffer[offset] = newValue
        }
    }
    deinit {
        storageBuffer.baseAddress!.deallocate()
        
    }
}


struct Image{
    private var width : Int
    private var height : Int
    private var pixels : Pixels
    private var mutating : Pixels{
        mutating get{
            if !isKnownUniquelyReferenced(&pixels){
                pixels = Pixels(pixels: pixels)
            }
            return pixels
        }
    }
//    From here to the end of the document, i just copy a solution i found on git. I don't undestand for what is "value" and why UInt8,
//    the subscript it's easy to undestand, and the function clear(:value) also it's easy to undestand, but , and a big BUT!, the book never talk about
//    "UnsafeMutableBufferPointer", storageBuffer, etc... it's so frustrating they just put some code and don't explain, or at least "you have to search this methods or classes" or "you can study more in this link...". This is the second time with the same issue, in another chapter, it's the same case, bad explaining challenge.... the book it's awsome, but this thing's just make you to hate the author of the chapter, i will learn   this from de swift documentation or hacking with swift( Paul Hudson could do a waaaaaaaay better job explaining this challenge). I hope the next chapter don't have the same issue for me(yeah for me, i dont think this problem of "redaction" it's bother everyone, i think it's dependes how it's the best way i/you/we learn, for me, i just don't like when the author don't explain clearly what it's the problem, like this challenge, i will love to read 20 extra pages if the author explain what each line of code from Pixel class do.... or the clear function with the storageBuffer(i search in the entire book, just in this challenge use this method.... that's it's the problem for me). I could search? yeah, but this book it's almost perfect to learn, so why they fall in the same error that every udemy/edx/etc course(except Angela You, love her..)?. It's frustrating to find this kind of "must don't do" in this book, so that's why i criticize this. for this things, i say 8/10 stars, one of the best book of swift but... well you know...
    
    fileprivate init(width : Int, height: Int, value : UInt8) {
        self.width = width
        self.height = height
        self.pixels = Pixels(size: width * height, value: value)
    }
    
    subscript(x: Int, y: Int) -> UInt8 {
      get {
        return pixels[y * width + x]
      }
      set {
        mutating[y * width + x] = newValue
      }
    }
    
    mutating func clear(with value: UInt8) {
      for (i, _) in self.mutating.storageBuffer.enumerated() {
        self.mutating.storageBuffer[i] = value
      }
    }
}

var image1 = Image(width: 4, height: 4, value: 0)

// test setting and getting
image1[0,0] // -> 0
image1[0,0] = 100
image1[0,0] // -> 100
image1[1,1] // -> 0
// copy
var image2 = image1
image2[0,0] // -> 100
image1[0,0] = 2
image1[0,0] // -> 2
image2[0,0] // -> 100 because of copy-on-write
var image3 = image2
image3.clear(with: 255)
image3[0,0] // -> 255
image2[0,0] // -> 100 thanks again, copy-on-write
/*:

### Challenge 2
 
 If you were Apple and wanted to modify `UIImage` to replace it with a value type that had the mutating functions described above, could you do this in a way that is backward compatible with code which uses the existing `UIImage` API?
 */
// Yes. Because UIImage is already immutable, it already has value semantics.  Using a copy-on-write implementation you could introduce mutating methods while preserving value semantics. Since adding mutability to its API would only be adding new behaviors, rather than modifying existing ones, this would be backward-compatible with existing use sites.
/*:
 ### Challenge 3
 
 Consider the test snippet used to determine if a type has value semantics. What would you need to do in order to define an automatic means to test if a type supports value semantics? If someone hands you a type, can you know for sure if it offers value semantics? What if you cannot see its implementation? Could the compiler be expected to know?
 */
/* The test snippet defines an _operational_ test of value semantics. The recipe for value semantic constitutes a more limited _deductive_ test. What is the potential for automating either of these?
 
 The operational test would be challenging to automate. Just as it is difficult to prove something does not exist (because you might not have looked hard enough yet) it is difficult to *prove* value semantics. As soon as some interaction with a variable has a side-effect on another variable, then you have shown the variable is not of a value semantic type. But how could you ever know that you have tried all possible interactions? One could imagine automatic tests that tried a large variety of random interactions, to see if one generated side-effects, but this would not be a comprehensive test. Similarly, one detects side-effects in the code snippet by seeing changes in the value of a variable. To automate this would require an automated way to determine the value of a variable, which would be difficult to do explicitly for types which do not define an `Equatable` implementation based on their contents.
 
 A deductive test of value semantics, based on the recipe for value semantics, would also be imperfect. In particular cases 1-3 appear to be possible to check automatically, since they amount to checking relatively simple aspects of types and their properties, questions like "is it a primitive value type?", "Are all the properties constant?", etc.. However, case 4, the case of value types containing mutable reference types, seems less susceptible to automated verification.
 */
