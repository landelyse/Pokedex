# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Swift command-line tool project implementing a Vector Database for a Naver Boost challenge mission (days 15-16). The project demonstrates vector database concepts including vector embedding, indexing, and similarity searching using LSH (Locality-Sensitive Hashing) and cosine similarity algorithms.

## Project Structure

```
challenge-mission-day-15–16/
├── challenge-mission-day-15–16.xcodeproj/    # Xcode project file
└── challenge-mission-day-15–16/             # Source directory
    ├── main.swift                           # Main entry point
    ├── App_VectorDBAppManager.swift         # Application flow manager
    ├── App_VectorDBService.swift            # Vector DB service coordinator
    ├── Error.swift                          # Custom error definitions
    ├── Protocol_*.swift                     # Protocol definitions
    ├── Impl_*.swift                         # Protocol implementations
    ├── Test_*.swift                         # Unit test files
    ├── README.md                           # Project documentation
    ├── 학습정리.md                          # Learning notes (Korean)
    └── 나만의체크포인트.md                   # Personal checkpoint notes (Korean)
```

## Architecture Overview

The codebase follows a protocol-oriented architecture with clear separation of concerns:

### Core Components Architecture
```
VectorDBAppManager
    → VectorDBService
    → IOProtocol

VectorDBService
    → VectorEncoding
    → DBRepository  
    → SimilaritySearching
    → VectorIndexing

Dependencies:
- SimilaritySearching ⇢ VectorIndexing (weak dependency)
- DBRepository ⇢ VectorIndexing (weak dependency)
```

### Error Hierarchy
- `SimilarityError`
- `DataBaseError` 
- `IndexingError`

### Protocol Layer (노란색 - Yellow in design docs)
- `Protocol_IOProtocol.swift` - User interaction interface
- `Protocol_VectorEncoding.swift` - Vector embedding abstraction
- `Protocol_DBRepository.swift` - Persistent storage interface
- `Protocol_SimilaritySearching.swift` - Similarity search algorithms

### Implementation Layer (초록색 - Green in design docs)
- `Impl_IOProtocol.swift` - Console I/O implementation
- `Impl_VectorEncoding.swift` - Vector embedding implementation
- `Impl_DBRepository.swift` - Database operations implementation
- `Impl_SimilaritySearching.swift` - LSH and cosine similarity implementation

### Application Layer (분홍색 - Pink in design docs)
- `App_VectorDBAppManager.swift` - Overall application flow control
- `App_VectorDBService.swift` - Vector database service coordination

## Development Commands

### Building the Project
```bash
# Build Debug configuration
xcodebuild -project challenge-mission-day-15–16.xcodeproj -scheme challenge-mission-day-15–16 -configuration Debug

# Build Release configuration  
xcodebuild -project challenge-mission-day-15–16.xcodeproj -scheme challenge-mission-day-15–16 -configuration Release
```

### Running the Project
```bash
# Run the built executable directly
./DerivedData/Build/Products/Debug/challenge-mission-day-15–16

# Build and run in one step
xcodebuild -project challenge-mission-day-15–16.xcodeproj -scheme challenge-mission-day-15–16 -configuration Debug && ./DerivedData/Build/Products/Debug/challenge-mission-day-15–16
```

### Testing
```bash
# Run specific test files using Swift compiler
swift Test_VectorEncoding.swift
swift Test_SimilaritySearching.swift
swift Test_VectorIndexing.swift
swift Test_DBRepository.swift
swift Test_DBService.swift
swift Test_AppManager.swift
```

### Opening in Xcode
```bash
open challenge-mission-day-15–16.xcodeproj
```

## Implementation Priority & Strategy

Based on the project documentation, implementation follows this priority order:

1. **VectorEncoding** (가장 중요) - Core vector transformation functionality
2. **VectorIndexing** (두 번째 중요) - LSH-based indexing for efficient search
3. **SimilaritySearching** (세 번째 중요) - Cosine similarity search algorithms
4. **DBRepository, VectorDBService** (중요하지만 긴급하지 않음) - Data persistence and service coordination
5. **IOProtocol, AppManager** (가장 후순위) - User interface and application management

## Vector Database Implementation Details

### Core Algorithms
- **Indexing**: LSH (Locality-Sensitive Hashing) with hyperplane-based bucketing
- **Similarity**: Cosine similarity for semantic vector comparison
- **Search**: ANN (Approximate Nearest Neighbor) search within LSH buckets

### Key Design Decisions
- Protocol-oriented architecture for testability and modularity
- Dependency injection to enable independent unit testing
- LSH over linear search for scalability with high-dimensional vectors
- Cosine similarity over Euclidean distance for semantic meaning preservation

## Configuration Details

- **Development Team**: ZS9874H9ND
- **Swift Version**: 5.0
- **Deployment Target**: macOS 15.2
- **Code Signing**: Automatic
- **Hardened Runtime**: Enabled

## 커밋 메시지 컨벤션
- 변경 사항을 바탕으로 한글 커밋 메시지 작성
- 접두사는 축약식으로 작성: feat, docs, refac, test, fix
- 예시: `docs: README 스프린트 기록 업데이트`

## Working with this Project

When making changes:
1. Follow the protocol-oriented design patterns established in the codebase
2. Implement protocols first, then concrete implementations
3. Write unit tests for each component following the `Test_*.swift` naming convention
4. Use dependency injection for loose coupling between components
5. Consider the established priority order when adding new features
6. All Swift files use Foundation framework conventions