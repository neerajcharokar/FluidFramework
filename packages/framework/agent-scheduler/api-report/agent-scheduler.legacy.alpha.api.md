## Alpha API Report File for "@fluidframework/agent-scheduler"

> Do not edit this file. It is a report generated by [API Extractor](https://api-extractor.com/).

```ts

// @alpha @legacy (undocumented)
export class AgentSchedulerFactory implements IFluidDataStoreFactory {
    // (undocumented)
    static createChildInstance(parentContext: IFluidDataStoreContext): Promise<IAgentScheduler>;
    // (undocumented)
    get IFluidDataStoreFactory(): AgentSchedulerFactory;
    // (undocumented)
    instantiateDataStore(context: IFluidDataStoreContext, existing: boolean): Promise<FluidDataStoreRuntime>;
    // (undocumented)
    static get registryEntry(): NamedFluidDataStoreRegistryEntry;
    // (undocumented)
    static readonly type = "_scheduler";
    // (undocumented)
    readonly type = "_scheduler";
}

// @alpha @legacy (undocumented)
export const IAgentScheduler: keyof IProvideAgentScheduler;

// @alpha @legacy
export interface IAgentScheduler extends IProvideAgentScheduler, IEventProvider<IAgentSchedulerEvents>, IFluidLoadable {
    pick(taskId: string, worker: () => Promise<void>): Promise<void>;
    pickedTasks(): string[];
    register(...taskUrls: string[]): Promise<void>;
    release(...taskUrls: string[]): Promise<void>;
}

// @alpha @legacy
export interface IAgentSchedulerEvents extends IEvent {
    (event: "picked" | "released" | "lost", listener: (taskId: string) => void): any;
}

// @alpha @legacy (undocumented)
export interface IProvideAgentScheduler {
    // (undocumented)
    readonly IAgentScheduler: IAgentScheduler;
}

// @alpha @legacy
export interface ITaskSubscriptionEvents extends IEvent {
    // (undocumented)
    (event: "gotTask" | "lostTask", listener: () => void): any;
}

// @alpha @legacy
export class TaskSubscription extends TypedEventEmitter<ITaskSubscriptionEvents> {
    constructor(agentScheduler: IAgentScheduler, taskId: string);
    haveTask(): boolean;
    // (undocumented)
    readonly taskId: string;
    volunteer(): void;
}

// (No @packageDocumentation comment for this package)

```
